//
//  Finish_Line_Dash_App.swift
//  Finish Line Dash!
//
//  Created by Dan Stoakes on 14/08/2021.
//

import SwiftUI

@main
struct Finish_Line_Dash_App: App {
    let viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
