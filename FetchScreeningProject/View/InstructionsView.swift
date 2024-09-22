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
                    Text("\(mealDetails.instructions[index])")
                        .padding()
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray.opacity(0.1))
                        )
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
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
