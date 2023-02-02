//
//  ContentView.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 20.12.22.
//

import SwiftUI

struct ProductsView: View {
    @State var clothes = [Clothe]()
    @StateObject var favorites = Favorites()
    
    @EnvironmentObject var order: Order
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(filteredClothes) { item in
                        NavigationLink {
                            ClotheDetailView(clothe: item)
                                .environmentObject(order)
                        } label: {
                            VStack {
                                AsyncImage(url: URL(string: item.image),scale: 3) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("$ \(item.price, specifier: "%.2f")")
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        if favorites.contains(item) {
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                    Text(item.title)
                                        .lineLimit(2)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .task {
                await fetchData()
            }
            .navigationTitle("👗 Products")
            .searchable(text: $searchText, prompt: "Search for a clothe")
        }
        .environmentObject(favorites)
    }
    var filteredClothes: [Clothe] {
        if searchText.isEmpty {
            return clothes
        } else {
            return clothes.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func fetchData() async{
        // dont re-fetch if its already fetched
        guard clothes.isEmpty else {
            return
        }
        
        do {
            let url = URL(string: "https://fakestoreapi.com/products")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            clothes = try decoder.decode([Clothe].self, from: data)
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(Order())
    }
}

// things to improve
// 1. make it searchable - done
// 2. favorites section - half done
// 3. show customer's bag - done
// 4. rating view - half done
