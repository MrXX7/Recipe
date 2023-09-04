//
//  RecipeView.swift
//  Recipe
//
//  Created by Oncu Can on 5.09.2023.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var recipeManager: RecipeManager
    @State var selectedRecipe: Recipe? = nil
    var body: some View {
        NavigationView {
            ScrollView {
                HorizontalScrolling(recipeManager: recipeManager)
                    .padding(.vertical)
                VStack {
                    ForEach(recipeManager.recipes) { recipe in
                        RecipeCard(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .background(.ultraThinMaterial)
                .fullScreenCover(item: $selectedRecipe, content: { recipe in
                    RecipeDetailView(recipe: recipe)
                })
            }
            .background(.ultraThinMaterial)
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeManager: RecipeManager())
            .preferredColorScheme(.dark)
    }
}
