//
//  AnimalsViewModel.swift
//  Animals
//
//  Created by Juan Frausto on 02/12/23.
//

import Foundation
import CoreData

@MainActor
class AnimalsViewModel : NSObject, ObservableObject{
    private (set) var context : NSManagedObjectContext
    @Published var animals = [AnimalModel]()
    private let fetchResultController : NSFetchedResultsController<AnimalEntity>
    init(context:NSManagedObjectContext){
        self.context = context
        fetchResultController = NSFetchedResultsController(fetchRequest: AnimalEntity.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchResultController.delegate = self
        
        do{
            try fetchResultController.performFetch()
            guard let animals = fetchResultController.fetchedObjects else {
                return
            }
            for animal in animals {
                print(animal.id!)
                print(animal.name!)
                print(animal.headline!)
                for gallery in animal.galleryArray{
                    print(gallery.unwrappedImage)
                }
            }
            self.animals = animals.map(AnimalModel.init)
        }
        catch{
            print(error)
        }
    }
    
}

extension AnimalsViewModel : NSFetchedResultsControllerDelegate{
   
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let animals = controller.fetchedObjects as? [AnimalEntity] else {
            return
        }
        self.animals = animals.map(AnimalModel.init)
    }
}




struct AnimalModel : Identifiable{
    private var animal : AnimalEntity
    init(animal:AnimalEntity){
        self.animal = animal
    }
    
    var id : UUID {
        animal.id ?? UUID()
    }
    
    var name : String {
        animal.name ?? ""
    }
    
    var headline : String {
        animal.headline ?? ""
    }
    
    var galleries : [GalleryEntity]{
        animal.galleryArray
    }
}
