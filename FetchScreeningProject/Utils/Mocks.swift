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
    
    static let instructions2: [String] = [
        "Heat oven to 180C/160C fan/gas 4 and line the base and sides of a 20cm square tin with baking parchment (the easiest way is to cross 2 x 20cm-long strips over the base). To make the almond sponge, put the butter, sugar, flour, ground almonds, baking powder, eggs, vanilla and almond extract in a large bowl. Beat with an electric whisk until the mix comes together smoothly. Scrape into the tin, spreading to the corners, and bake for 25-30 mins – when you poke in a skewer, it should come out clean. Cool in the tin for 10 mins, then transfer to a wire rack to finish cooling while you make the second sponge.",
        "For the pink sponge, line the tin as above. Mix all the ingredients together as above, but don’t add the almond extract. Fold in some pink food colouring. Then scrape it all into the tin and bake as before. Cool.",
        "To assemble, heat the jam in a small pan until runny, then sieve. Barely trim two opposite edges from the almond sponge, then well trim a third edge. Roughly measure the height of the sponge, then cutting from the well-trimmed edge, use a ruler to help you cut 4 slices each the same width as the sponge height. Discard or nibble leftover sponge. Repeat with pink cake.",
        "Take 2 x almond slices and 2 x pink slices and trim so they are all the same length. Roll out one marzipan block on a surface lightly dusted with icing sugar to just over 20cm wide, then keep rolling lengthways until the marzipan is roughly 0.5cm thick. Brush with apricot jam, then lay a pink and an almond slice side by side at one end of the marzipan, brushing jam in between to stick sponges, and leaving 4cm clear marzipan at the end. Brush more jam on top of the sponges, then sandwich remaining 2 slices on top, alternating colours to give a checkerboard effect. Trim the marzipan to the length of the cakes.",
        "Carefully lift up the marzipan and smooth over the cake with your hands, but leave a small marzipan fold along the bottom edge before you stick it to the first side. Trim opposite side to match size of fold, then crimp edges using fingers and thumb (or, more simply, press with prongs of fork). If you like, mark the 10 slices using the prongs of a fork.",
        "Assemble second Battenberg and keep in an airtight box or well wrapped in cling film for up to 3 days. Can be frozen for up to a month."
    ]
    
    static let mealDetailResponse: MealDetailsResponse = MealDetailsResponse(name: "Battenberg Cake", instructions: instructions2, ingredients: ingredients)
}
