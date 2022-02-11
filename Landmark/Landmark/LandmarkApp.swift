//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Hanif Pramono on 13/04/21.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
