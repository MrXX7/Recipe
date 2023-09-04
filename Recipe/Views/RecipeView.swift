//
//  RecipeView.swift
//  Recipe
//
//  Created by Oncu Can on 5.09.2023.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var recipeManager: RecipeManager
    var body: some View {
        NavigationView {
            List(recipeManager.recipes) { recipe in
                RecipeCard(recipe: recipe)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeManager: RecipeManager())
            .preferredColorScheme(.dark)
    }
}
