import SwiftUI

struct CalorieHeaderView: View {
    let totalCalories: Int

    @ScaledMetric(relativeTo: .largeTitle) private var fontSize: CGFloat = 64

    var body: some View {
        Text(totalCalories, format: .number)
            .font(.system(size: fontSize, weight: .bold, design: .rounded))
            .foregroundStyle(.primary)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .padding(.top, 40)
            .padding(.bottom, 8)
            .accessibilityLabel("Total calories today: \(totalCalories)")
            .accessibilityAddTraits(.isHeader)
    }
}
