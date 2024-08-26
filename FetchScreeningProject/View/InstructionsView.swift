//
//  InstructionsView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/26/24.
//

import SwiftUI

struct InstructionsView: View {
    @Binding var mealDetails: MealDetailsResponse?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .foregroundStyle(.primary)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            VStack {
                ForEach((mealDetails?.instructions ?? []).indices, id: \.self) { index in
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
                        
                        Text("\(mealDetails?.instructions[index] ?? "")")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                }
            }
        }
    }
}

//#Preview {
//    InstructionsView(instructions: Mocks.instructions)
//}
