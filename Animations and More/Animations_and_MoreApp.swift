//
//  Animations_and_MoreApp.swift
//  Animations and More
//
//  Created by Jeffrey Klinkhamer on 05/06/2024.
//

import SwiftUI

@main
struct Animations_and_MoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
