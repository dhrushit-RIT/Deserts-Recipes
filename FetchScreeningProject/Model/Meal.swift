//
//  Meal.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/18/24.
//

import Foundation

struct Meal: Codable, Identifiable {
    private (set) var id: String? = UUID().uuidString
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
