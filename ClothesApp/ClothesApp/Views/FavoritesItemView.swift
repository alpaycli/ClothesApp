//
//  FavoritesItemView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 12.01.23.
//

import SwiftUI

struct FavoritesItemView: View {
    
    let clothe: Clothe
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: clothe.image),scale: 1) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }
            
            Text(clothe.title)
        }
    }
}

struct FavoritesItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesItemView(clothe: Clothe.example)
    }
}
