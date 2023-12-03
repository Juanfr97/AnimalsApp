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
    @Published var image: String = ""
    @Published var description: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var factsList: [String] = []
    @Published var galleryList: [String] = []
    
    init(context:NSManagedObjectContext){
        self.context = context
    }
    
    func save(){
        do{
            let animal = AnimalEntity(context: context)
            animal.id = UUID()
            animal.name = name
            animal.headline = headline
            animal.descriptions = description
            animal.image = image
            animal.latitude = latitude
            animal.longitude = longitude
            
            for imageUrl in galleryList {
                let gallery = GalleryEntity(context: context)
                gallery.id = UUID()
                gallery.image = imageUrl
                animal.addToGalleries(gallery)
            }
                    
            for factText in factsList {
                let fact = FactEntity(context: context)
                fact.id = UUID()
                fact.fact = factText
                animal.addToFacts(fact)
            }
            
            try animal.save()
        }
        catch{
            print(error)
        }
        
    }
    
}
