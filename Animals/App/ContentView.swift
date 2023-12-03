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
            AnimalsView(vm:AnimalsViewModel(context: viewContext)).tabItem {
                Image(systemName: "pawprint.circle.fill")
                Text("Animales")
            }
            MapsView(vm:AnimalsViewModel(context: viewContext)).tabItem {
                Image(systemName: "map")
                Text("Localizaciones")
            }
        } // :TAB
    }
}

#Preview {
    ContentView()
}
