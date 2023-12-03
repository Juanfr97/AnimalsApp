//
//  CoreDataManager.swift
//  Animals
//
//  Created by Juan Frausto on 02/12/23.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistenceStoreContainer : NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init () {
        persistenceStoreContainer = NSPersistentContainer(name: "AnimalsDataModel")
        persistenceStoreContainer.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Imposible inicializar core data \(error)")
            }
            
        }
    }
}
