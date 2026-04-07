import SwiftUI

struct FoodEntryRow: View {
    let entry: FoodEntry

    var body: some View {
        HStack {
            Text(entry.name)
                .font(.body)
                .foregroundStyle(.primary)
            Spacer()
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text("\(entry.calories)")
                    .font(.body.bold())
                    .foregroundStyle(.primary)
                Text("cal")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 8)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(entry.name), \(entry.calories) calories")
    }
}
