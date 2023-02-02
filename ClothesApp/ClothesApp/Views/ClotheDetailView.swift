//
//  ClotheDetailView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 05.01.23.
//

import SwiftUI

struct ClotheDetailView: View {
    let clothe: Clothe
    
    @EnvironmentObject var favorites: Favorites
    @EnvironmentObject var order: Order
    @State private var rating = 3
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: clothe.image),scale: 1) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(spacing: 5) {
                    Button {
                        favorites.contains(clothe) ? favorites.remove(clothe) : favorites.add(clothe)
                    } label: {
                        Image(systemName: favorites.contains(clothe) ? "heart.fill" : "heart")
                            .foregroundColor(.black)
                    }
                    .padding(.top)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    
                    Text("SAVE")
                        .fontWeight(.semibold)
                        .padding(.bottom, 15)
                }
                .overlay(Rectangle().frame(width: 360, height: 1, alignment: .bottom).foregroundColor(Color.gray), alignment: .bottom)
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        Text("$ \(clothe.price, specifier: "%.2f")")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        Text(clothe.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                        
                        VStack(alignment: .leading) {
                            Text("Rate it!")
                                .fontWeight(.bold)
                            
                            RatingView(clothe: clothe, rating: $rating)
                                .padding(.bottom, 15)
                        }
                    }
                    .padding(.leading, 20)
                }
                .overlay(Rectangle().frame(width: 360, height: 1, alignment: .bottom).foregroundColor(Color.gray), alignment: .bottom)
            }
            
            Button("ADD TO BAG") {
                order.addCard(item: clothe)
            }
            .frame(width: 360, height: 45)
            .background(Color(hue: 0.347, saturation: 0.785, brightness: 0.342))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(.vertical)
        }
    }
}

struct ClotheDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClotheDetailView(clothe: Clothe.example)
                .environmentObject(Order())
        }
    }
}
