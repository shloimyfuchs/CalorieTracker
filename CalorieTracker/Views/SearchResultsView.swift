import SwiftUI

struct SearchResultsView: View {
    let results: [FoodItem]
    let isLoading: Bool
    var onSelect: (FoodItem) -> Void

    var body: some View {
        ScrollView {
            if isLoading {
                LazyVStack(spacing: 0) {
                    ForEach(0..<6, id: \.self) { _ in
                        SkeletonRow()
                    }
                }
            } else if results.isEmpty {
                Text("No results found")
                    .font(.title2)
                    .foregroundStyle(.tertiary)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 100)
            } else {
                LazyVStack(spacing: 0) {
                    ForEach(results) { item in
                        Button {
                            onSelect(item)
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(item.name)
                                        .font(.body)
                                        .foregroundStyle(.primary)
                                    Text(item.servingDescription)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                    Text("\(item.calories)")
                                        .font(.body.bold())
                                        .foregroundStyle(.primary)
                                    Text("cal")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                        }
                        if item != results.last {
                            Divider()
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .background(.background)
    }
}

// MARK: - Skeleton Loading

private struct SkeletonRow: View {
    @State private var shimmer = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(.systemGray5))
                    .frame(width: .random(in: 90...140), height: 14)
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(.systemGray6))
                    .frame(width: 60, height: 10)
            }
            Spacer()
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(.systemGray5))
                .frame(width: 50, height: 14)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .opacity(shimmer ? 0.4 : 1.0)
        .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: shimmer)
        .onAppear { shimmer = true }
    }
}
