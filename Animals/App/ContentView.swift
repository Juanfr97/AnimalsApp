//
//  ContentView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct ContentView: View {
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
        } // :TAB
    }
}

#Preview {
    ContentView()
}
