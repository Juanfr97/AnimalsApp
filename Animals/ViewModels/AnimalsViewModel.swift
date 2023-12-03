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
