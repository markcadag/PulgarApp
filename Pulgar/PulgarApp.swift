//
//  PulgarApp.swift
//  Pulgar
//
//  Created by iOS Developer on 9/12/22.
//

import SwiftUI

@main
struct PulgarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
