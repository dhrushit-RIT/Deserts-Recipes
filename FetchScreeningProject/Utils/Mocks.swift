//
//  Mocks.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import Foundation

class Mocks {
    static let meal = Meal(
        strMeal: "Battenberg Cake",
        strMealThumb: "https://www.themealdb.com/images/media/meals/ywwrsp1511720277.jpg",
        idMeal: "52894"
    )
    
    static let ingredients = [
        Ingredient(name: "Sugar", quantity: "45g"),
        Ingredient(name: "Salt", quantity: "1/2 tsp"),
        Ingredient(name: "Peanut Butter", quantity: "3 tbs"),
        Ingredient(name: "Milk", quantity: "200ml"),
        Ingredient(name: "Oil", quantity: "60ml"),
        Ingredient(name: "Baking Powder", quantity: "3tsp"),
        Ingredient(name: "Unsalted Butter", quantity: "25g"),
        Ingredient(name: "Eggs", quantity: "2"),
        Ingredient(name: "Flour", quantity: "1600g")
    ]
    
    static let instructions: [String] = [
        "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.",
        "Spread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.",
        "Add butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.",
        "Cut into wedges and best eaten when it is warm."
    ]
}
