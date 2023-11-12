//
//  AppDelegate.swift
//  picnicchef
//
//  Created by macOS on 5/11/2023.
//

import Foundation
import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        return true
    }
    
    // Add any additional app delegate methods if necessary
}
 
