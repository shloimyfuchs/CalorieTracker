import Foundation

actor USDAFoodService {
    private let apiKey = "DEMO_KEY"
    private let baseURL = "https://api.nal.usda.gov/fdc/v1/foods/search"

    func search(_ query: String) async throws -> [FoodItem] {
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return [] }

        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: trimmed),
            URLQueryItem(name: "pageSize", value: "20"),
            URLQueryItem(name: "dataType", value: "Survey (FNDDS)")
        ]

        guard let url = components.url else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(USDASearchResponse.self, from: data)

        return response.foods.compactMap { food in
            let nutrients = Dictionary(
                food.foodNutrients.map { ($0.nutrientId, $0.value) },
                uniquingKeysWith: { first, _ in first }
            )

            let calories = Int(nutrients[1008] ?? 0)
            guard calories > 0 else { return nil }

            return FoodItem(
                name: food.description.capitalized,
                calories: calories,
                proteinGrams: nutrients[1003] ?? 0,
                carbsGrams: nutrients[1005] ?? 0,
                fatGrams: nutrients[1004] ?? 0,
                servingDescription: "1 serving"
            )
        }
    }
}

// MARK: - USDA API Response Models

private struct USDASearchResponse: Decodable {
    let foods: [USDAFood]
}

private struct USDAFood: Decodable {
    let description: String
    let foodNutrients: [USDANutrient]
}

private struct USDANutrient: Decodable {
    let nutrientId: Int
    let value: Double
}
