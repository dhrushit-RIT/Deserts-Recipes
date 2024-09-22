//
//  MealDetailsView.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 9/20/24.
//

import SwiftUI

enum DetailType: CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    
    case ingredients
    case instructions
    
    var pickerTitle: String {
        switch self {
        case .ingredients: return "Ingredients"
        case .instructions: return "Instructions"
        }
    }
}

struct HeightPreferenceKey: PreferenceKey {
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
    
    static var defaultValue: CGFloat = 0
}


struct MealDetailsView: View {
    @State private var selectedDetail: DetailType? = .ingredients
    @State private var activeTab: DetailType = .ingredients
    @State private var contentHeight: CGFloat = 100
    
    var viewModel: MealDetailsViewModel
    var mealImage: String
    
    init(viewModel: MealDetailsViewModel, mealImage: String) {
        self.viewModel = viewModel
        self.mealImage = mealImage
        
        print(mealImage)
        
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    if let url = URL(string: mealImage) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .scaledToFill()
                                .ignoresSafeArea()
                        } placeholder: {
                            Rectangle()
                                .fill(.background)
                                .frame(maxWidth: .infinity)
                        }
                        .ignoresSafeArea()
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    Section {
                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .top, spacing: 0) {
                                ForEach(DetailType.allCases) { type in
                                    if let details = viewModel.details {
                                        switch type {
                                        case .ingredients:
                                            IngredientsListView(mealDetails: details)
                                                .tag(DetailType.ingredients.id)
                                                .background {
                                                    GeometryReader { geo in
                                                        Color.clear.preference(key: HeightPreferenceKey.self, value: geo.size.height)
                                                    }
                                                }
                                            
                                        case .instructions:
                                            InstructionsView(mealDetails: details)
                                                .tag(DetailType.instructions.id)
                                                .background {
                                                    GeometryReader { geo in
                                                        Color.clear.preference(key: HeightPreferenceKey.self, value: geo.size.height)
                                                    }
                                                }
                                        }
                                    }
                                }
                                .frame(height: contentHeight, alignment: .top)
                                .padding()
                                .containerRelativeFrame(.horizontal, alignment: .center)
                            }
                        }
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
                        .onPreferenceChange(HeightPreferenceKey.self, perform: { height in
                            contentHeight = height
                        })
                    } header: {
                        VStack {
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
                        }
                        .background(ignoresSafeAreaEdges: .all)
                        .background {
                            Color.white
                        }
                    }
                }
                .presentationDetents([.medium, .large])
                .navigationTitle(viewModel.details?.name ?? "")
                .presentationCornerRadius(20)
            }
            .task {
                try? await viewModel.fetchDetails()
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct PreviewView: View {
    @State var viewModel = MealDetailsViewModel(mealID: Mocks.meal.idMeal)
    var body: some View {
        MealDetailsView(viewModel: viewModel, mealImage: Mocks.meal.strMealThumb)
            .task {
                try? await viewModel.fetchDetails()
            }
    }
}

#Preview {
    PreviewView()
}
