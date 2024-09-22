//
//  IngredientsListView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/26/24.
//

import SwiftUI

struct IngredientsListView: View {
    @Binding var mealDetails: MealDetailsResponse?
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingredients")
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Spacer()
                Text("\(mealDetails?.ingredients.count ?? 0) Items")
                    .foregroundStyle(.secondary)
            }
            
            ForEach (mealDetails?.ingredients ?? [], id: \.name) { ingredient in
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
    }
}

struct PreviewIngredientsListView: View {
    @State var mealDetailResponse: MealDetailsResponse? = Mocks.mealDetailResponse
    var body: some View {
        IngredientsListView(mealDetails: $mealDetailResponse)
    }
}

#Preview {
    PreviewIngredientsListView()
}
