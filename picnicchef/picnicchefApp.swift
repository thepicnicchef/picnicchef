//
//  picnicchefApp.swift
//  picnicchef
//
//  Created by macOS on 24/10/2023.
//

import SwiftUI

@main
struct picnicchefApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                // Fallback on earlier versions
                // Provide an alternative view compatible with earlier iOS versions
            }
        }
    }
}
