//
//  VisaAppApp.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI
import Firebase
import GoogleMobileAds

@main
struct VisaAppApp: App {
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "F8BB1C28-BAE8-11D6-9C31-00039315CD46" ,"74e40c4a1fd65ccfb362d68b3a9a1388"]
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
