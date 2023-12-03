//
//  AnimalListItem.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct AnimalListItem: View {
    let animal : AnimalModel
    var body: some View {
        HStack(alignment:.center,spacing: 16){
            AsyncImage(url: URL(string: animal.image)){ image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 90,height: 90)
                    .clipShape(
                    Circle()
                    )
            }
        placeholder:{
            ProgressView()
        }
            VStack(alignment: .leading,spacing: 8){
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
            }
        }
    }
}
