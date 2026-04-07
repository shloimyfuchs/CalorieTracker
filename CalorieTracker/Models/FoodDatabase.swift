import Foundation

struct FoodDatabase {
    static let foods: [FoodItem] = [
        // Breakfast
        FoodItem(name: "Oatmeal", calories: 420, proteinGrams: 12, carbsGrams: 68, fatGrams: 8, servingDescription: "1 bowl"),
        FoodItem(name: "Scrambled Eggs", calories: 182, proteinGrams: 12, carbsGrams: 2, fatGrams: 14, servingDescription: "2 eggs"),
        FoodItem(name: "Greek Yogurt", calories: 130, proteinGrams: 17, carbsGrams: 6, fatGrams: 4, servingDescription: "1 cup"),
        FoodItem(name: "Pancakes", calories: 350, proteinGrams: 8, carbsGrams: 52, fatGrams: 12, servingDescription: "3 pancakes"),
        FoodItem(name: "Avocado Toast", calories: 280, proteinGrams: 7, carbsGrams: 28, fatGrams: 16, servingDescription: "1 slice"),
        FoodItem(name: "Granola Bar", calories: 140, proteinGrams: 3, carbsGrams: 22, fatGrams: 5, servingDescription: "1 bar"),
        FoodItem(name: "Cereal with Milk", calories: 220, proteinGrams: 7, carbsGrams: 38, fatGrams: 4, servingDescription: "1 bowl"),
        FoodItem(name: "Smoothie Bowl", calories: 310, proteinGrams: 8, carbsGrams: 52, fatGrams: 8, servingDescription: "1 bowl"),
        FoodItem(name: "Bagel with Cream Cheese", calories: 380, proteinGrams: 11, carbsGrams: 54, fatGrams: 14, servingDescription: "1 bagel"),
        FoodItem(name: "French Toast", calories: 300, proteinGrams: 10, carbsGrams: 36, fatGrams: 12, servingDescription: "2 slices"),

        // Fruits
        FoodItem(name: "Banana", calories: 105, proteinGrams: 1.3, carbsGrams: 27, fatGrams: 0.4, servingDescription: "1 medium"),
        FoodItem(name: "Apple", calories: 95, proteinGrams: 0.5, carbsGrams: 25, fatGrams: 0.3, servingDescription: "1 medium"),
        FoodItem(name: "Orange", calories: 62, proteinGrams: 1.2, carbsGrams: 15, fatGrams: 0.2, servingDescription: "1 medium"),
        FoodItem(name: "Strawberries", calories: 50, proteinGrams: 1, carbsGrams: 12, fatGrams: 0.5, servingDescription: "1 cup"),
        FoodItem(name: "Blueberries", calories: 85, proteinGrams: 1.1, carbsGrams: 21, fatGrams: 0.5, servingDescription: "1 cup"),
        FoodItem(name: "Grapes", calories: 104, proteinGrams: 1.1, carbsGrams: 27, fatGrams: 0.2, servingDescription: "1 cup"),
        FoodItem(name: "Mango", calories: 135, proteinGrams: 1.1, carbsGrams: 35, fatGrams: 0.6, servingDescription: "1 cup"),
        FoodItem(name: "Watermelon", calories: 86, proteinGrams: 1.7, carbsGrams: 22, fatGrams: 0.4, servingDescription: "2 cups"),

        // Lunch & Dinner
        FoodItem(name: "Grilled Chicken Breast", calories: 165, proteinGrams: 31, carbsGrams: 0, fatGrams: 3.6, servingDescription: "4 oz"),
        FoodItem(name: "Salmon Fillet", calories: 280, proteinGrams: 34, carbsGrams: 0, fatGrams: 16, servingDescription: "6 oz"),
        FoodItem(name: "Brown Rice", calories: 215, proteinGrams: 5, carbsGrams: 45, fatGrams: 1.8, servingDescription: "1 cup"),
        FoodItem(name: "White Rice", calories: 205, proteinGrams: 4.3, carbsGrams: 45, fatGrams: 0.4, servingDescription: "1 cup"),
        FoodItem(name: "Caesar Salad", calories: 350, proteinGrams: 14, carbsGrams: 18, fatGrams: 26, servingDescription: "1 bowl"),
        FoodItem(name: "Turkey Sandwich", calories: 380, proteinGrams: 28, carbsGrams: 36, fatGrams: 14, servingDescription: "1 sandwich"),
        FoodItem(name: "Pasta with Marinara", calories: 420, proteinGrams: 14, carbsGrams: 72, fatGrams: 8, servingDescription: "1 plate"),
        FoodItem(name: "Steak", calories: 400, proteinGrams: 42, carbsGrams: 0, fatGrams: 24, servingDescription: "8 oz"),
        FoodItem(name: "Burrito Bowl", calories: 550, proteinGrams: 32, carbsGrams: 56, fatGrams: 22, servingDescription: "1 bowl"),
        FoodItem(name: "Fish Tacos", calories: 320, proteinGrams: 22, carbsGrams: 28, fatGrams: 14, servingDescription: "2 tacos"),
        FoodItem(name: "Vegetable Stir Fry", calories: 250, proteinGrams: 8, carbsGrams: 32, fatGrams: 10, servingDescription: "1 plate"),
        FoodItem(name: "Chicken Soup", calories: 180, proteinGrams: 14, carbsGrams: 18, fatGrams: 6, servingDescription: "1 bowl"),
        FoodItem(name: "Sushi Roll", calories: 300, proteinGrams: 12, carbsGrams: 42, fatGrams: 8, servingDescription: "6 pieces"),
        FoodItem(name: "Pizza Slice", calories: 285, proteinGrams: 12, carbsGrams: 36, fatGrams: 10, servingDescription: "1 slice"),
        FoodItem(name: "Burger", calories: 540, proteinGrams: 34, carbsGrams: 40, fatGrams: 28, servingDescription: "1 burger"),
        FoodItem(name: "Grilled Shrimp", calories: 120, proteinGrams: 24, carbsGrams: 0, fatGrams: 2, servingDescription: "6 shrimp"),
        FoodItem(name: "Chicken Wrap", calories: 410, proteinGrams: 28, carbsGrams: 38, fatGrams: 16, servingDescription: "1 wrap"),
        FoodItem(name: "Lentil Soup", calories: 230, proteinGrams: 18, carbsGrams: 40, fatGrams: 1, servingDescription: "1 bowl"),

        // Sides & Snacks
        FoodItem(name: "Almonds", calories: 164, proteinGrams: 6, carbsGrams: 6, fatGrams: 14, servingDescription: "1 oz"),
        FoodItem(name: "Protein Bar", calories: 220, proteinGrams: 20, carbsGrams: 24, fatGrams: 8, servingDescription: "1 bar"),
        FoodItem(name: "Trail Mix", calories: 175, proteinGrams: 5, carbsGrams: 16, fatGrams: 11, servingDescription: "1/4 cup"),
        FoodItem(name: "String Cheese", calories: 80, proteinGrams: 7, carbsGrams: 1, fatGrams: 5, servingDescription: "1 stick"),
        FoodItem(name: "Hummus with Crackers", calories: 200, proteinGrams: 6, carbsGrams: 22, fatGrams: 10, servingDescription: "1 serving"),
        FoodItem(name: "Dark Chocolate", calories: 170, proteinGrams: 2, carbsGrams: 13, fatGrams: 12, servingDescription: "1 oz"),
        FoodItem(name: "Popcorn", calories: 110, proteinGrams: 3, carbsGrams: 22, fatGrams: 1, servingDescription: "3 cups"),
        FoodItem(name: "Peanut Butter", calories: 190, proteinGrams: 8, carbsGrams: 6, fatGrams: 16, servingDescription: "2 tbsp"),
        FoodItem(name: "Rice Cakes", calories: 35, proteinGrams: 1, carbsGrams: 7, fatGrams: 0.3, servingDescription: "1 cake"),
        FoodItem(name: "Hard Boiled Egg", calories: 78, proteinGrams: 6, carbsGrams: 0.6, fatGrams: 5, servingDescription: "1 egg"),
        FoodItem(name: "Cottage Cheese", calories: 110, proteinGrams: 12, carbsGrams: 4, fatGrams: 5, servingDescription: "1/2 cup"),
        FoodItem(name: "Edamame", calories: 120, proteinGrams: 11, carbsGrams: 9, fatGrams: 5, servingDescription: "1/2 cup"),
        FoodItem(name: "Sweet Potato", calories: 103, proteinGrams: 2, carbsGrams: 24, fatGrams: 0.1, servingDescription: "1 medium"),
        FoodItem(name: "French Fries", calories: 365, proteinGrams: 4, carbsGrams: 48, fatGrams: 17, servingDescription: "1 serving"),

        // Drinks
        FoodItem(name: "Coffee with Cream", calories: 50, proteinGrams: 1, carbsGrams: 2, fatGrams: 4, servingDescription: "1 cup"),
        FoodItem(name: "Orange Juice", calories: 112, proteinGrams: 2, carbsGrams: 26, fatGrams: 0.5, servingDescription: "1 cup"),
        FoodItem(name: "Protein Shake", calories: 250, proteinGrams: 30, carbsGrams: 20, fatGrams: 5, servingDescription: "1 shake"),
        FoodItem(name: "Whole Milk", calories: 150, proteinGrams: 8, carbsGrams: 12, fatGrams: 8, servingDescription: "1 cup"),
        FoodItem(name: "Green Tea", calories: 0, proteinGrams: 0, carbsGrams: 0, fatGrams: 0, servingDescription: "1 cup"),
        FoodItem(name: "Soda", calories: 140, proteinGrams: 0, carbsGrams: 39, fatGrams: 0, servingDescription: "1 can"),
        FoodItem(name: "Smoothie", calories: 200, proteinGrams: 4, carbsGrams: 40, fatGrams: 2, servingDescription: "12 oz"),
        FoodItem(name: "Latte", calories: 190, proteinGrams: 10, carbsGrams: 18, fatGrams: 8, servingDescription: "12 oz"),
        FoodItem(name: "Black Coffee", calories: 2, proteinGrams: 0.3, carbsGrams: 0, fatGrams: 0, servingDescription: "1 cup"),
        FoodItem(name: "Coconut Water", calories: 45, proteinGrams: 2, carbsGrams: 9, fatGrams: 0.5, servingDescription: "1 cup"),
    ]

    static func search(_ query: String) -> [FoodItem] {
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return [] }
        let lowered = trimmed.lowercased()
        return foods.filter { $0.name.lowercased().contains(lowered) }
    }
}
