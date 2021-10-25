//
//  indNshApp.swift
//  indNsh
//
//  Created by Travis Moody on 10/25/21.
//

import SwiftUI

@main
struct indNshApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
