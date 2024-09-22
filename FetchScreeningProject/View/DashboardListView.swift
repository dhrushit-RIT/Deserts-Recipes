//
//  DashboardListView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import SwiftUI

struct DashboardListView: View {
    @State private var path = NavigationPath()
    var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.meals, id: \.idMeal) { meal in
                    NavigationLink(destination: {
                        MealDetailsView(meal: meal)
                    }, label: {
                        DashboardListCell(meal: meal)
                    })
                }
            }
            .navigationTitle("Deserts")
            .navigationDestination(for: MealDetailsView.self, destination: { view in
                view
            })
            .listStyle(.plain)
            .task {
                try? await viewModel.fetchMenuItemList()
            }
        }
    }
}

#Preview {
    DashboardListView()
}
