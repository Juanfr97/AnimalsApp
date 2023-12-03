//
//  AnimalsApp.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

@main
struct AnimalsApp: App {
    var body: some Scene {
        let viewContext = CoreDataManager.shared.persistenceStoreContainer.viewContext
        WindowGroup {
            ContentView().environment(\.managedObjectContext,viewContext)
        }
    }
}
