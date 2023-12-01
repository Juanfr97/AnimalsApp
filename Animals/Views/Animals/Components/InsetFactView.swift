//
//  InsetFactView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//
import SwiftUI

struct InsetFactView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,idealHeight: 168,maxHeight: 180)
            
        } // :BOX
    }
}
