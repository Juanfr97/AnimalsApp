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
    private static let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    var body: some View {
        VStack {
            
            Form{
                if !addAnimalViewModel.image.isEmpty{
                    AsyncImage(url: URL(string: addAnimalViewModel.image)){ img in
                        img.resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        .cornerRadius(12)
                    }
                    placeholder:{
                        ProgressView()
                    }
                    .centerHorizontally()
                }
                Group{
                    HeadingView(headingImage: "pawprint.circle.fill", headingText: "Informacion")
                    TextField("Nombre",text:$addAnimalViewModel.name)
                    TextField("Imagen",text:$addAnimalViewModel.image)
                   
                }
                
                Group {
                    HeadingView(headingImage: "flame", headingText: "Headline")
                    TextField("Headline",text:$addAnimalViewModel.headline,axis: .vertical).lineLimit(20)
                }
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Galeria")
                    ForEach(addAnimalViewModel.galleryList.indices, id: \.self) { index in
                                        TextField("Imagen \(index + 1)", text: $addAnimalViewModel.galleryList[index])
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                    }
                                    .onDelete { indices in
                                        addAnimalViewModel.galleryList.remove(atOffsets: indices)
                                    }

                                    HStack {
                                        Button(action: {
                                            addAnimalViewModel.galleryList.append("")
                                        }) {
                                            Label("Agregar imagen", systemImage: "plus")
                                        }

                                        Spacer()
                                    }
                }
                Group {
                                    
                    HeadingView(headingImage: "questionmark.circle", headingText: "¿Sabías que?")
                    ForEach(addAnimalViewModel.factsList.indices, id: \.self) { index in
                                        TextField("Hecho interesante \(index + 1)", text: $addAnimalViewModel.factsList[index])
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                    }
                                    .onDelete { indices in
                                        addAnimalViewModel.factsList.remove(atOffsets: indices)
                                    }

                                    HStack {
                                        Button(action: {
                                            // Agregar un nuevo elemento a la lista cuando se presiona el botón +
                                            addAnimalViewModel.factsList.append("")
                                        }) {
                                            Label("Agregar hecho interesante", systemImage: "plus")
                                        }

                                        Spacer()
                                    }
                    }
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "Descripcion")
                    TextField("Descripcion",text:$addAnimalViewModel.description,axis: .vertical).lineLimit(20)
                }
                Group {
                    HeadingView(headingImage: "map", headingText: "Coordenadas")
                    HStack{
                        TextField("Latitud", value: $addAnimalViewModel.latitude, formatter: Self.formatter).keyboardType(.numbersAndPunctuation)
                        Spacer()
                        TextField("Longitud", value: $addAnimalViewModel.longitude, formatter: Self.formatter).keyboardType(.numbersAndPunctuation)
                    }
                }
                
                
                Button("Guardar"){
                    addAnimalViewModel.save()
                    presentationMode.wrappedValue.dismiss()
                }.centerHorizontally()
            }
        }
    }
}

struct AddAnimalView_Previews : PreviewProvider{
    static var previews : some View {
        let viewContext = CoreDataManager.shared.persistenceStoreContainer.viewContext
        AddAnimalView(vm:AddAnimalViewModel(context: viewContext))
    }
}
