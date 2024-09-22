//
//  DashboardItemView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 9/22/24.
//

import SwiftUI

struct DashboardItemView: View {
    var meal: Meal
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: meal.strMealThumb)!) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .frame(alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.4))
                    .frame(width: 120, height: 120)
            }
            
            Spacer()
                .frame(height: 8)
            
            Text("\(meal.strMeal)")
                .fontWeight(.semibold)
                .padding(.vertical)
                .lineLimit(2)
                .frame(alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
        .frame(width: 120, height: 200)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.1))
        )
    }
}

#Preview {
    DashboardItemView(meal: Mocks.meal)
}
