//
//  AppTabView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 06.01.23.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "")
                }
            
            FavoritesView(favorites: Favorites())
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            BagView()
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
            .environmentObject(Order())
    }
}
