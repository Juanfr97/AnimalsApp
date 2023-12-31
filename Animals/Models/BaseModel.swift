//
//  BaseModel.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import Foundation
import CoreData

protocol BaseModel{
    static var viewContext : NSManagedObjectContext {get}
    func save() throws
    func delete() throws 
    
}

extension BaseModel where Self : NSManagedObject{
    static var viewContext : NSManagedObjectContext{
        CoreDataManager.shared.persistenceStoreContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws{
        Self.viewContext.delete(self)
        try save()
    }
}
