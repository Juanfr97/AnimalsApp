//
//  AddAnimalViewModel.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import Foundation
import CoreData
class AddAnimalViewModel: ObservableObject{
    
    var context : NSManagedObjectContext
    @Published var name : String = ""
    @Published var headline : String = ""
    
    init(context:NSManagedObjectContext){
        self.context = context
    }
    
    func save(){
        do{
            let animal = AnimalEntity(context: context)
            let gallery = GalleryEntity(context: context)
            
            animal.id = UUID()
            animal.name = name
            animal.headline = headline
            gallery.id = UUID()
            gallery.image = "http:test\(animal.name ?? "").com"
            animal.addToGalleries(gallery)
            try animal.save()
        }
        catch{
            print(error)
        }
        
    }
    
}
