import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @Query(sort: \FoodEntry.loggedAt, order: .reverse)
    private var allEntries: [FoodEntry]

    @State private var viewModel = DailyLogViewModel()
    @FocusState private var isInputFocused: Bool

    private var todayEntries: [FoodEntry] {
        allEntries.filter { Calendar.current.isDateInToday($0.loggedAt) }
    }

    private var totalCalories: Int {
        todayEntries.reduce(0) { $0 + $1.calories }
    }

    private var totalProtein: Double {
        todayEntries.reduce(0) { $0 + $1.proteinGrams }
    }

    private var totalCarbs: Double {
        todayEntries.reduce(0) { $0 + $1.carbsGrams }
    }

    private var totalFat: Double {
        todayEntries.reduce(0) { $0 + $1.fatGrams }
    }

    var body: some View {
        VStack(spacing: 0) {
            CalorieHeaderView(totalCalories: totalCalories)

            MacroSummaryView(
                protein: totalProtein,
                carbs: totalCarbs,
                fat: totalFat
            )

            ZStack {
                FoodLogListView(entries: todayEntries) { indexSet in
                    for index in indexSet {
                        modelContext.delete(todayEntries[index])
                    }
                }

                if viewModel.isSearching {
                    SearchResultsView(
                        results: viewModel.searchResults,
                        isLoading: viewModel.isLoading
                    ) { item in
                        viewModel.logFood(item, context: modelContext)
                        isInputFocused = false
                    }
                    .transition(reduceMotion ? .opacity : .move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            InputBarView(
                searchText: $viewModel.searchText,
                isFocused: $isInputFocused,
                onSubmit: {},
                onCameraTap: { /* Placeholder for v1 */ },
                onMicTap: { /* Placeholder for v1 */ }
            )
        }
        .task(id: viewModel.searchText) {
            await viewModel.performSearch()
        }
        .animation(reduceMotion ? .none : .spring(duration: 0.3), value: viewModel.isSearching)
        .onTapGesture {
            if isInputFocused && !viewModel.isSearching {
                isInputFocused = false
            }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: FoodEntry.self, inMemory: true)
}

