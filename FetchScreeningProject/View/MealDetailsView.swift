//
//  MealDetailView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import SwiftUI

struct MealDetailsView: View {
    @State private var meal: Meal
    @State private var expanded = true
    @State private var viewModel: MealDetailsViewModel
    
    var ingredients: [Ingredient] {
        viewModel.details?.ingredients ?? []
    }
    
    var instructions: [String] {
        viewModel.details?.instructions ?? []
    }
    
    init(meal: Meal) {
        self.meal = meal
        viewModel = MealDetailsViewModel(mealID: meal.idMeal)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                IngredientsListView(mealDetails: $viewModel.details)
                InstructionsView(mealDetails: $viewModel.details)
            }
            .padding()
            .task {
                try? await viewModel.fetchDetails()
            }
        }
        .navigationTitle(viewModel.details?.name ?? "")
    }
}

extension MealDetailsView: Hashable {
    static func == (lhs: MealDetailsView, rhs: MealDetailsView) -> Bool {
        return lhs.meal.idMeal == rhs.meal.idMeal
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(meal.idMeal)
    }
}

#Preview {
    MealDetailsView(meal: Mocks.meal)
}
