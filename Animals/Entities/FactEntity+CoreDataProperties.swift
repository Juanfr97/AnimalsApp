//
//  FactEntity+CoreDataProperties.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//
//

import Foundation
import CoreData


extension FactEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FactEntity> {
        return NSFetchRequest<FactEntity>(entityName: "FactEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var fact: String?
    @NSManaged public var animal: AnimalEntity?
    
    public var unwrappedFact : String {
        fact ?? ""
    }

}

extension FactEntity : Identifiable {

}
