//
//  IngredientsListView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/26/24.
//

import SwiftUI

struct IngredientsListView: View {
    var mealDetails: MealDetailsResponse
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingredients")
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Spacer()
                Text("\(mealDetails.ingredients.count) Items")
                    .foregroundStyle(.secondary)
            }
            
            VStack {
                ForEach (mealDetails.ingredients, id: \.name) { ingredient in
                    HStack {
                        Text("\(ingredient.name)")
                        Spacer()
                        Text("\(ingredient.quantity)")
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 32)
                    Divider()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.1))
            )
        }
    }
}

struct PreviewIngredientsListView: View {
    @State var mealDetailResponse: MealDetailsResponse = Mocks.mealDetailResponse
    var body: some View {
        IngredientsListView(mealDetails: mealDetailResponse)
    }
}

#Preview {
    PreviewIngredientsListView()
}
