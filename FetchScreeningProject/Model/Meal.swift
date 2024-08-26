//
//  Meal.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/18/24.
//

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
