//
//  ClothesAppApp.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 20.12.22.
//

import SwiftUI

@main
struct ClothesAppApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(order)
        }
    }
}
