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
    private var editAnimal : AnimalEntity?
    
    
    init(context:NSManagedObjectContext,animal:AnimalModel? = nil){
        self.context = context
        if let animal = animal {
            initAnimal(animal: animal)
        }
    }
    
    func initAnimal(animal:AnimalModel){
        let id = animal.id
        let fetchRequest: NSFetchRequest<AnimalEntity> = AnimalEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do{
            let result = try context.fetch(fetchRequest)
            if let animal = result.first{
                name = animal.name ?? ""
                headline = animal.headline ?? ""
                image = animal.image ?? ""
                description = animal.descriptions ?? ""
                latitude = animal.latitude
                longitude = animal.longitude
                factsList = animal.factsArray.map{
                    $0.unwrappedFact
                }
                galleryList = animal.galleryArray.map{
                    $0.unwrappedImage
                }
                editAnimal = animal
            }
        }
        catch{
            print(error)
        }
    }
    
    func save() {
        do {
            if let existingAnimal = editAnimal {
                existingAnimal.name = name
                existingAnimal.headline = headline
                existingAnimal.descriptions = description
                existingAnimal.image = image
                existingAnimal.latitude = latitude
                existingAnimal.longitude = longitude
                
                existingAnimal.removeFromGalleries(existingAnimal.galleries!)
                existingAnimal.removeFromFacts(existingAnimal.facts!)
                
                for imageUrl in galleryList {
                    let gallery = GalleryEntity(context: context)
                    gallery.id = UUID()
                    gallery.image = imageUrl
                    existingAnimal.addToGalleries(gallery)
                }
                
                for factText in factsList {
                    let fact = FactEntity(context: context)
                    fact.id = UUID()
                    fact.fact = factText
                    existingAnimal.addToFacts(fact)
                }
            } else {
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
            }
            
            try context.save()
        } catch {
            print("Error saving animal: \(error.localizedDescription)")
        }
    }

    
}
