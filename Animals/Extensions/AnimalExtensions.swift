//
//  AnimalExtensions.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import Foundation
import CoreData

extension AnimalEntity : BaseModel{
    static var all: NSFetchRequest<AnimalEntity> {
        let request = AnimalEntity.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
