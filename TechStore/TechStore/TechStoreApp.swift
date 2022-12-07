//
//  TechStoreApp.swift
//  TechStore
//
//  Created by Alehandro on 5.12.22.
//

import SwiftUI

@main
struct TechStoreApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
