//
//  InstructionsView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/26/24.
//

import SwiftUI

struct InstructionsView: View {
    var mealDetails: MealDetailsResponse

    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .foregroundStyle(.primary)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            VStack {
                ForEach((mealDetails.instructions).indices, id: \.self) { index in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .frame(width: 20)
                            .font(.title2)
                            .foregroundStyle(.primary)
                            .padding(.trailing, 8)
                        
                        Spacer()
                            .frame(width: 4)
                            .frame(maxHeight: .infinity)
                            .background(Color.secondary)
                            .padding(.trailing, 4)
                        
                        Text("\(mealDetails.instructions[index])")
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                }
            }
        }
    }
}
struct PreviewInstructionsView: View {
    @State var mealDetailResponse: MealDetailsResponse = Mocks.mealDetailResponse
    var body: some View {
        InstructionsView(mealDetails: mealDetailResponse)
    }
}

#Preview {
    PreviewInstructionsView()
}
