//
//  BagItemView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 10.01.23.
//

import SwiftUI

struct BagItemView: View {
    @EnvironmentObject var order: Order
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
            
            VStack(alignment: .leading, spacing: 10) {
                Text(clothe.title)
                    .lineLimit(1)
                    .fontWeight(.bold)
                
                Text("$ \(clothe.price, specifier: "%.2f")")
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
            }
            .frame(width: 160)
            
            Spacer()
            
            Button {
                withAnimation {
                    order.removeCard(item: clothe)
                }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10 )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BagItemView_Previews: PreviewProvider {
    static var previews: some View {
        BagItemView(clothe: Clothe.example)
    }
}
