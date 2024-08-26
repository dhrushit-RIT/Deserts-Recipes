//
//  ContentView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/18/24.
//

import SwiftUI
import SwiftData

// MARK: - Note to evaluator
/// Please ignore the swift data related code. Nothing has been implemented with regards to that.
/// I have divided the view components into `DashboardListView`, `IngredientsListView`, and `InstructionsView` in order to allow improving the views further.
/// My plan is to add favorites section and context menu to allow making some of the desserts faovrite.
///

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        DashboardListView()
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
