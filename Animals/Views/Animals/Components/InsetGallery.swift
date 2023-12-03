//
//  InsetGallery.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct InsetGallery: View {
    let animal : AnimalModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment:.center,spacing: 15) {
                
                ForEach(animal.galleries, id: \.self) { item in
                    AsyncImage(url: URL(string: item)){ img in
                        img.resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        .cornerRadius(12)
                    }
                    placeholder:{
                        ProgressView()
                    }
                }
            } // ENDD OF HSTACK
        } // END OF SCROLL
    }
}

