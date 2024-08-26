//
//  DashboardViewModel.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import Foundation
import Observation

@Observable
class DashboardViewModel {
    // MARK: - variables
    private let url: String = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    var meals: [Meal] = []
    
    // MARK: - methods
    func fetchMenuItemList(_ fetchType: FetchType = .useExistingData) async throws {
        // avoid fetch call if we already have the data
        if case fetchType = .useExistingData, !meals.isEmpty {
            return
        }
        
        do {
            guard let url = URL(string: url) else { throw DashboardErrors.invalidURL }
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonObject = try JSONDecoder().decode(MealsResponse.self, from: data)
            self.meals = jsonObject.meals.sorted { $0.strMeal < $1.strMeal }
        } catch let error {
            guard let error = error as? DashboardErrors else {
                print("DEBUG \(error)")
                return
            }
            switch error {
            case .invalidURL:
                print("DEBUG url provided is invalid")
            case .parseError:
                print("DEBUG could not parse the received object using the MealsResponse model")
                throw DashboardErrors.parseError
            case .requestFailure:
                print("DEBUG could not complete the request successfully")
            }
        }
    }
}
