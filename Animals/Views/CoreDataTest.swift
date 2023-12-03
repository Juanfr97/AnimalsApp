//
//  CoreDataTest.swift
//  Animals
//
//  Created by Juan Frausto on 02/12/23.
//

import SwiftUI

struct CoreDataTest: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var animalsViewModel : AnimalsViewModel
    @State private var isPresented : Bool = false
    init(vm : AnimalsViewModel){
        self.animalsViewModel = vm
    }
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(animalsViewModel.animals){ animal in
                        Text(animal.name)
                    }
                }
            }
            .sheet(isPresented: $isPresented, content: {
                AddAnimalView(vm:AddAnimalViewModel(context:viewContext))
            })
            .navigationTitle("Animales")
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing:16){
                            Button {
                                print("Test")
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

struct CoreDataTest_Previews : PreviewProvider{
    static var previews : some View {
        let viewContext = CoreDataManager.shared.persistenceStoreContainer.viewContext
        CoreDataTest(vm:AnimalsViewModel(context: viewContext))
    }
}
