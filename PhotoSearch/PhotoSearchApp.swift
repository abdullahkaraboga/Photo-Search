//
//  PhotoSearchApp.swift
//  PhotoSearch
//
//  Created by Abdullah Karaboğa on 16.01.2023.
//

import SwiftUI

@main
struct PhotoSearchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
