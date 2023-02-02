//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Alpay Calalli on 02.12.22.
//

import Foundation

@MainActor class Favorites: ObservableObject {
    
    
    @Published var clothes: [String]
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
    
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            clothes = try JSONDecoder().decode([String].self, from: data)
        } catch {
            clothes = []
        }
    
    }
    
    func contains(_ clothe: Clothe) -> Bool {
        clothes.contains(clothe.title)
    }
    
    func add(_ clothe: Clothe) {
        objectWillChange.send()
        clothes.append(clothe.title)
        save()
    }
    
    func remove(_ clothe: Clothe) {
        objectWillChange.send()
        clothes.removeAll { $0 == clothe.title }
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(clothes)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            print("Data succesfully saved")
        } catch {
            print("Unable to save data")
        }
    }
}
