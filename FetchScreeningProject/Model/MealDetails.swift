//
//  MealDetails.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import Foundation

enum MealCategory: Int, CaseIterable {
    case beef, chicken, dessert, lamb, miscellaneous, pasta, pork, seafood, side, starter, vegan, vegetarian, breakfast, goat
}

struct MealDetails {
    var mealId: String
    var name: String
    var drinkAlternate: String?
    var category: MealCategory
    var strArea: String
    var strInstructions: String
    var strMealThumb: String
    var strTags: [String]
    var strYoutube: String?
    var ingredients: [Ingredient]
    var source: String?
    var imageSource: String?
    var creativeCommonsConfirmed: String?
    var dateModified: String
}
