//
//  BagView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 06.01.23.
//

import SwiftUI

struct BagView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    if order.items.count > 0 {
                        ForEach(order.items) { item in
                            BagItemView(clothe: item)
                        }
                        
                        HStack {
                            Text("Your total is ")
                                .fontWeight(.semibold)
                            +
                            Text(" $\(order.total)")
                                .fontWeight(.bold)
                            
                        }
                        
                    } else {
                        VStack {
                            Spacer()
                            
                            Text("😢")
                                .font(.system(size: 70))
                            
                            Text("YOUR BAG IS EMPTY.")
                                .padding(.top, 100)
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                            
                            
                            NavigationLink {
                                ProductsView()
                            } label: {
                                Text("CONTINUE SHOPPING")
                                    .frame(width: 300, height: 45)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .background(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 1)
                                            .stroke(.lightBackground)
                                    )
                            }
                        }
                        .background(Color(red: 93.0, green: 93.0, blue: 89.0))
                    }
                    
                    
                }
                .navigationTitle("🎒 Your bag")
            }
        }
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        BagView()
            .environmentObject(Order())
    }
}
