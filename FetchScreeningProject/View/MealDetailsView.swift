//
//  MealDetailView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import SwiftUI

enum DetailType: CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    
    case ingredients
    case instructions
    
    var pickerTitle: String {
        switch self {
        case .ingredients: return "Ingredients"
        case .instructions: return "Instructions"
        }
    }
}

struct MealDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var meal: Meal
    @State private var expanded = true
    @State private var showSheet = true
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
        VStack {
            if let url = URL(string: meal.strMealThumb) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                } placeholder: {
                    Rectangle()
                        .fill(.background)
                        .frame(maxWidth: .infinity)
                }
                .ignoresSafeArea()
            }
            Spacer()
        }
        .task {
            try? await viewModel.fetchDetails()
        }
        .sheet(isPresented: $showSheet, onDismiss: {
            dismiss()
        }) {
            TabDetailView(viewModel: $viewModel)
        }
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
