import SwiftUI
import SwiftData

struct FoodLogListView: View {
    let entries: [FoodEntry]
    let onDelete: (IndexSet) -> Void

    var body: some View {
        List {
            ForEach(entries) { entry in
                FoodEntryRow(entry: entry)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            .onDelete(perform: onDelete)
        }
        .listStyle(.plain)
    }
}
