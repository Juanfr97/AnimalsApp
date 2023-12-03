//
//  ContentView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    let viewContext = CoreDataManager.shared.persistenceStoreContainer.viewContext
    
    var body: some View {
        TabView {
            AnimalsView().tabItem {
                Image(systemName: "pawprint.circle.fill")
                Text("Animales")
            }
            MapsView().tabItem {
                Image(systemName: "map")
                Text("Localizaciones")
            }
            CoreDataTest(vm:AnimalsViewModel(context: viewContext)).tabItem {
                Image(systemName: "plus")
                Text("Test")
            }
        } // :TAB
    }
}

#Preview {
    ContentView()
}
