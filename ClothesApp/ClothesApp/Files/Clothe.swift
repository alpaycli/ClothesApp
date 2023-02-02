//
//  Clothe.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 20.12.22.
//

import Foundation

struct Clothe: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Ratings
    
    static let example = Clothe(id: 1, title: "Shirt", price: 30.0, description: "Good", category: "Men's clothing", image: "url", rating: Ratings(rate: 3.0, count: 3))
}

struct Ratings: Codable {
    let rate: Double
    let count: Int
}

