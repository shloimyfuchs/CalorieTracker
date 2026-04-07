import SwiftUI

struct MacroSummaryView: View {
    let protein: Double
    let carbs: Double
    let fat: Double

    var body: some View {
        HStack(spacing: 40) {
            macroColumn(label: "Protein", value: protein)
            macroColumn(label: "Carbs", value: carbs)
            macroColumn(label: "Fat", value: fat)
        }
        .padding(.bottom, 24)
    }

    private func macroColumn(label: String, value: Double) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("\(Int(value))g")
                .font(.title3.bold())
                .foregroundStyle(.primary)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(label): \(Int(value)) grams")
    }
}
