//
//  TabDetailView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 9/20/24.
//

import SwiftUI

struct TabDetailView: View {
    @State private var selectedDetail: DetailType? = .ingredients
    @State private var activeTab: DetailType = .ingredients
    @State private var contentHeight: CGFloat = 100
    
    @Binding var viewModel: MealDetailsViewModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 20)
                    Text(viewModel.details?.name ?? "")
                        .font(.title)
                        .padding()
                    Picker("Selected Detail", selection: $activeTab) {
                        ForEach(DetailType.allCases) {
                            Text("\($0.pickerTitle)")
                                .tag($0.id)
                        }
                    }
                    .padding()
                    .pickerStyle(.segmented)
                    .onChange(of: activeTab) { oldValue, newValue in
                        withAnimation {
                            selectedDetail = newValue
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .top, spacing: 0) {
                            ForEach(DetailType.allCases) { type in
                                switch type {
                                case .ingredients:
                                    IngredientsListView(mealDetails: $viewModel.details)
                                        .tag(DetailType.ingredients.id)
                                        .onAppear {
                                            print(contentHeight)
                                        }
                                        
                                case .instructions:
                                    InstructionsView(mealDetails: $viewModel.details)
                                        .tag(DetailType.instructions.id)
                                        .onAppear {
                                            print(contentHeight)
                                        }
                                }
                            }
                            .padding()
                            .containerRelativeFrame(.horizontal, alignment: .center)
                        }
                    }
//                    .frame(height: contentHeight)
                    .scrollTargetBehavior(.paging)
                    .scrollPosition(id: $selectedDetail)
                    .scrollTargetLayout()
                    .scrollIndicators(.hidden)
                    .onChange(of: selectedDetail) { oldValue, newValue in
                        if let newValue {
                            withAnimation {
                                activeTab = newValue
                            }
                        }
                    }
                    
                }
                .padding()
                .presentationDetents([.medium, .large])
                .navigationTitle(viewModel.details?.name ?? "")
                .presentationCornerRadius(20)
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct PreviewView: View {
    @State var viewModel = MealDetailsViewModel(mealID: Mocks.meal.idMeal)
    var body: some View {
        TabDetailView(viewModel: $viewModel)
            .task {
                try? await viewModel.fetchDetails()
            }
    }
}

#Preview {
    PreviewView()
}
