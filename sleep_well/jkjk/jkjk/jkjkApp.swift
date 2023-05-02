//
//  jkjkApp.swift
//  jkjk
//
//  Created by Abdurahim Josef Al-Masri on 2023-04-27.
//

import SwiftUI

@main
struct jkjkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
