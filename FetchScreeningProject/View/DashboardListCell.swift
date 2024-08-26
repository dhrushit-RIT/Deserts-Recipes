//
//  DashboardListCell.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import SwiftUI

struct DashboardListCell: View {
//    @Binding var meal: Meal
    @State var meal: Meal
    var body: some View {
        ZStack {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: meal.strMealThumb)!) { data in
                    data
                        .image?
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.trailing, 16)
                        .padding(.leading, 16)
                    
                }
                Text(meal.strMeal)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
            }
            .frame(height: 100)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .frame(minWidth: .infinity)
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
            )
            .listRowSeparator(.hidden)
        }
        .task {
            
        }
    }
}

#Preview {
    let meal = Mocks.meal
    return DashboardListCell(meal: meal)
}
