//
//  GalleryEntity+CoreDataProperties.swift
//  Animals
//
//  Created by Juan Frausto on 02/12/23.
//
//

import Foundation
import CoreData


extension GalleryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GalleryEntity> {
        return NSFetchRequest<GalleryEntity>(entityName: "GalleryEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var animal: AnimalEntity?
    public var unwrappedImage : String {
        image ?? ""
    }

}

extension GalleryEntity : Identifiable {

}
