//
//  DiagoApp.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import SwiftUI

@main
struct DiagoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
