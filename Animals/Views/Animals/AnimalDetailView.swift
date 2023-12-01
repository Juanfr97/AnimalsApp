//
//  AnimalDetailView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal : Animal
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // Hero Image
                AsyncImage(url: URL(string: animal.image)){ img in
                    img.resizable()
                        .scaledToFit()
                }
                placeholder:{
                    ProgressView()
                }
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                        .frame(height: 6)
                        .offset(y:24)
                    )
                    
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                // Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Galeria")
                    
                    InsetGallery(animal: animal)
                    
                }
                .padding(.horizontal)
                // Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "¿Sabias que?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                // Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "Todo sobre \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                Group{
                    HeadingView(headingImage: "map", headingText: "Se encuentran en")
                    InsetMap()
                }
                .padding(.horizontal)
            } // END OF VSTACK
            .navigationTitle("\(animal.name)")
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        } // : END OF SCROLL
    }
}
