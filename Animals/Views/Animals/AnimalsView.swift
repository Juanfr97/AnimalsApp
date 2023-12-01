//
//  AnimalsView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import Foundation
import SwiftUI
struct AnimalsView: View {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView{
            Group{
                List {
                    Header()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    ForEach(animals){ animal in
                        NavigationLink{
                            AnimalDetailView(animal: animal)
                        } label:{
                            AnimalListItem(animal: animal)
                        }
                    }
                }
                
                Spacer()
            }.navigationTitle("Animales")
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing:16){
                            Button {
                                print("Test")
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "plus.app")
                                    .foregroundColor(.accentColor)
                                    .font(.title2)
                            }

                        }
                    }
                }
        }
       
    }
}

#Preview {
    AnimalsView()
}
