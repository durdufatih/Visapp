//
//  VisaAppApp.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI
import Firebase

@main
struct VisaAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
