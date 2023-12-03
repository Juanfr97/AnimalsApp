//
//  MapAnnotation.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct MapAnnotationView: View {
    var animal : AnimalModel
    @State private var animation : Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54,height: 54,alignment: .center)
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52,alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            AsyncImage(url: URL(string: animal.image)){ img in
                img
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48,height: 48,alignment: .center)
                .clipShape(Circle())
            }
        placeholder:{
            ProgressView()
        }
            
        }
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}
