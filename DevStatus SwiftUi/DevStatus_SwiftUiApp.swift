//
//  DevStatus_SwiftUiApp.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/3/23.
//

import SwiftUI

@main
struct DevStatus_SwiftUiApp: App {
    var viewModel = DevStatusViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
