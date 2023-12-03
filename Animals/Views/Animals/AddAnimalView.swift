//
//  AddAnimalView.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import SwiftUI

struct AddAnimalView: View {
    @ObservedObject var addAnimalViewModel : AddAnimalViewModel
    @Environment(\.presentationMode) var presentationMode
    init(vm : AddAnimalViewModel){
        self.addAnimalViewModel = vm
    }
    var body: some View {
        Form{
            TextField("Nombre",text:$addAnimalViewModel.name)
            TextField("Headline",text:$addAnimalViewModel.headline)
            Button("Save"){
                print("save")
                addAnimalViewModel.save()
                presentationMode.wrappedValue.dismiss()
                
            }
        }.navigationTitle("Agregar nuevo animal")
    }
}

struct AddAnimalView_Previews : PreviewProvider{
    static var previews : some View {
        let viewContext = CoreDataManager.shared.persistenceStoreContainer.viewContext
        AddAnimalView(vm:AddAnimalViewModel(context: viewContext))
    }
}
