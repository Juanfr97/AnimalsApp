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
    @Published var selectedAnimal : AnimalModel?
    private let fetchResultController : NSFetchedResultsController<AnimalEntity>
    private var animalsEntity = [AnimalEntity]()
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
            self.animals = animals.map(AnimalModel.init)
            self.animalsEntity = animals
        }
        catch{
            print(error)
        }
    }
    
    func deleteAnimal (indexSet: IndexSet){
        do{
            guard let index = indexSet.first else { return }
            let animal = animalsEntity[index]
            context.delete(animal)
            try context.save()
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
        self.animalsEntity = animals
    }
}
