import Foundation
import SwiftData

@Model
final class FoodEntry {
    var name: String
    var calories: Int
    var proteinGrams: Double
    var carbsGrams: Double
    var fatGrams: Double
    var loggedAt: Date

    init(name: String, calories: Int, proteinGrams: Double, carbsGrams: Double, fatGrams: Double, loggedAt: Date = .now) {
        self.name = name
        self.calories = calories
        self.proteinGrams = proteinGrams
        self.carbsGrams = carbsGrams
        self.fatGrams = fatGrams
        self.loggedAt = loggedAt
    }
}
