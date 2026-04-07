import Foundation
import SwiftData
import Observation

@Observable
final class DailyLogViewModel {
    var searchText: String = ""
    var isSearching: Bool = false
    var searchResults: [FoodItem] = []
    var isLoading: Bool = false

    private let usdaService = USDAFoodService()

    func performSearch() async {
        let query = searchText.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else {
            searchResults = []
            isSearching = false
            isLoading = false
            return
        }

        isSearching = true
        isLoading = true

        // Debounce — wait 300ms, bail if cancelled (user typed more)
        try? await Task.sleep(for: .milliseconds(300))
        guard !Task.isCancelled else { return }

        do {
            let results = try await usdaService.search(query)
            guard !Task.isCancelled else { return }
            searchResults = results.isEmpty ? FoodDatabase.search(query) : results
        } catch {
            guard !Task.isCancelled else { return }
            searchResults = FoodDatabase.search(query)
        }
        isLoading = false
    }

    func logFood(_ item: FoodItem, context: ModelContext) {
        let entry = FoodEntry(
            name: item.name,
            calories: item.calories,
            proteinGrams: item.proteinGrams,
            carbsGrams: item.carbsGrams,
            fatGrams: item.fatGrams
        )
        context.insert(entry)
        clearSearch()
    }

    func clearSearch() {
        searchText = ""
        isSearching = false
        searchResults = []
        isLoading = false
    }
}
