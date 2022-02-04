//
//  ProductsTaskApp.swift
//  ProductsTask
//
//  Created by ziad on 01/02/2022.
//

import SwiftUI

@main
struct ProductsTaskApp: App {
    var viewModel = NetworkModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}
