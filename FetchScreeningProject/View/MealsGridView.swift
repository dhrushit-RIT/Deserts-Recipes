//
//  MealsGridView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import SwiftUI

struct MealsGridView: View {
    @State private var path = NavigationPath()
    @State private var searchString: String = ""
    @State private var showDetailSheet = false
    @State private var mealToShow: Meal?
    
    var filteredMeals: [Meal] {
        guard !searchString.isEmpty else { return [] }
        return viewModel.meals.filter { $0.idMeal.contains(searchString) || $0.strMeal.contains(searchString) }
    }
    var viewModel = DashboardViewModel()
    
    let gridContent: [GridItem] = [
        GridItem(.fixed(150),  spacing: 30, alignment: .center),
        GridItem(.fixed(150),  spacing: 30, alignment: .center)
    ]
//    let gridContent: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            Spacer()
                .frame(height: 10)
            ScrollView {
                LazyVGrid(columns: gridContent, alignment: .center, spacing: 20, content: {
                    ForEach(searchString.isEmpty ? viewModel.meals : filteredMeals, id: \.idMeal) { meal in
                        DashboardItemView(meal: meal)
                            .onTapGesture {
                                showDetailSheet = true
                                mealToShow = meal
                            }
                    }
                })
            }
            .navigationTitle("Deserts")
            .sheet(item: $mealToShow, content: { meal in
                MealDetailsView(viewModel: MealDetailsViewModel(mealID: meal.idMeal), mealImage: meal.strMealThumb)
            })
            .presentationDetents([.large, .fraction(1.0)])
            .searchable(text: $searchString, prompt: "Search your fav recipe")
        }
        .task {
            try? await viewModel.fetchMenuItemList()
        }
    }
}

struct MealsList: View {
    @Binding var meals: [Meal]
    var body: some View {
        List {
            ForEach(meals, id: \.idMeal) { meal in
                NavigationLink(destination: {
                    MealDetailsView(viewModel: MealDetailsViewModel(mealID: Mocks.meal.idMeal), mealImage: Mocks.meal.strMealThumb)
                }, label: {
                    FavoriteListCell(meal: meal)
                })
            }
        }
        .navigationTitle("Deserts")
        .listStyle(.plain)
        
    }
}

#Preview {
    MealsGridView()
}
