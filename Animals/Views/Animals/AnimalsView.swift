//
//  AnimalsView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import Foundation
import SwiftUI
struct AnimalsView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var animalsViewModel : AnimalsViewModel
    @State private var isPresented : Bool = false
    init(vm : AnimalsViewModel){
        self.animalsViewModel = vm
    }
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView{
            Group{
                List {
                    Header()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    if animalsViewModel.animals.isEmpty{
                        Image(systemName: "pawprint.circle.fill")
                        Text("Sin animales")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                    .padding()
                    }
                    ForEach(animalsViewModel.animals){ animal in
                        NavigationLink{
                            AnimalDetailView(animal: animal)
                        } label:{
                            AnimalListItem(animal: animal)
                        }
                    }
                }
                
                Spacer()
            }
            .sheet(isPresented: $isPresented, content: {
                AddAnimalView(vm:AddAnimalViewModel(context:viewContext)).navigationTitle("Agregar nuevo animal")
            })
            .navigationTitle("Animales")
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing:16){
                            Button {
                                print("Test")
                                haptics.impactOccurred()
                                isPresented = true
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

struct AnimalsView_Previews : PreviewProvider{
    static var previews : some View {
        let viewContext = CoreDataManager.shared.persistenceStoreContainer.viewContext
        AnimalsView(vm:AnimalsViewModel(context: viewContext))
    }
}
