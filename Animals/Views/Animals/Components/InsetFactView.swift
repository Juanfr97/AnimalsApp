//
//  InsetFactView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//
import SwiftUI

struct InsetFactView: View {
    let animal : AnimalModel
    
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.facts, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,idealHeight: 168,maxHeight: 180)
            
        } // :BOX
    }
}
