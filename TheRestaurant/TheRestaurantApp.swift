//
//  TheRestaurantApp.swift
//  TheRestaurant
//
//  Created by Ahmed Tantawy on 15/03/2021.
//

import SwiftUI

@main
struct TheRestaurantApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
