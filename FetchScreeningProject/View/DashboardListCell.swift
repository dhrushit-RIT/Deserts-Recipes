//
//  DashboardListCell.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import SwiftUI

struct DashboardListCell: View {
    @State var meal: Meal
    
    @State private var cornerRadius = 12.0
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: meal.strMealThumb)!) { image in
                withAnimation {
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.4))
                    .frame(width: 80, height: 80)
            }
            Text(meal.strMeal)
                .font(.title3)
//                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

#Preview {
    let meal = Mocks.meal
    return DashboardListCell(meal: meal)
}
