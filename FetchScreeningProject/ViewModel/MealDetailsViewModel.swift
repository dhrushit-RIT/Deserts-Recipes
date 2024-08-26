//
//  MealDetailsViewModel.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/25/24.
//

import Foundation
import Observation

@Observable
class MealDetailsViewModel {
    //    private var api: String = "https://themealdb.com"
    //    private var endPoint: String = "/api/json/v1/1/lookup.php?\(query)"
    // TODO: break this into api, end point and query
    // TODO: move this to services file
    
    var api: String {
        "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
    }
    var mealID: String
    var details: MealDetailsResponse?
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    func fetchDetails() async throws {
        guard let url = URL(string: api) else { throw DetailsErrors.invalidURL }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("DEBUG " + (String(data: data, encoding: .utf8) ?? ""))
            let jsonObject = try JSONDecoder().decode(DetailsResponse.self, from: data)
            details = MealDetailsResponse.getInstance(from: jsonObject)
        } catch let error {
            print(error)
        }
    }
    
}

@Observable
class MealDetailsResponse {
    var name: String
    var instructions: [String]
    var ingredients: [Ingredient]
    
    init(name: String, instructions: [String], ingredients: [Ingredient]) {
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
    }
    
    static func getInstance(from response: DetailsResponse) -> MealDetailsResponse? {
        guard let firstItem = response.meals.first,
              let name = firstItem["strMeal"] ?? nil,
              let instructionsStr = firstItem["strInstructions"] ?? nil else {
            print("name or instructions not found in the response")
            return nil
        }
        var ingredients: [Ingredient] = []
        
        let instructions = instructionsStr.lines.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        print("DEBUG Instructions: \(instructions)")
        let measurementPrefix = "strMeasure"
        let ingredientPrefix = "strIngredient"
        
        firstItem.keys.forEach { key in
            if key.contains(ingredientPrefix),
               let ingredient = firstItem[key],
               let validIngredient = ingredient,
               !validIngredient.isEmpty,
               let measure = firstItem[measurementPrefix + key.filter("0123456789".contains)],
               let validMeasure = measure {
                ingredients.append(Ingredient(name: validIngredient, quantity: validMeasure))
            }
        }
        
        print("DEBUG instructions size:  \(instructions.count)")
        
        return MealDetailsResponse(
            name: name,
            instructions: instructions,
            ingredients: ingredients
        )
        
    }
}

struct DetailsResponse: Decodable {
    var meals: [[String: String?]]
}
