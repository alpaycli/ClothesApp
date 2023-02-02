//
//  FavoritesView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 06.01.23.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favorites: Favorites
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(Array(favorites.clothes), id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favorites: Favorites())
            
    }
}
