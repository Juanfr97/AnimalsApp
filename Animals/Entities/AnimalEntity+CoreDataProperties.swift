//
//  AnimalEntity+CoreDataProperties.swift
//  Animals
//
//  Created by Juan Frausto on 02/12/23.
//
//

import Foundation
import CoreData


extension AnimalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimalEntity> {
        return NSFetchRequest<AnimalEntity>(entityName: "AnimalEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var headline: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var link: String?
    @NSManaged public var image: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var galleries: NSSet?
    
    public var galleryArray : [GalleryEntity] {
        let gallerySet = galleries as? Set<GalleryEntity> ?? []
        return gallerySet.sorted{
            $0.unwrappedImage < $1.unwrappedImage
        }
    }

}

// MARK: Generated accessors for galleries
extension AnimalEntity {

    @objc(addGalleriesObject:)
    @NSManaged public func addToGalleries(_ value: GalleryEntity)

    @objc(removeGalleriesObject:)
    @NSManaged public func removeFromGalleries(_ value: GalleryEntity)

    @objc(addGalleries:)
    @NSManaged public func addToGalleries(_ values: NSSet)

    @objc(removeGalleries:)
    @NSManaged public func removeFromGalleries(_ values: NSSet)

}

extension AnimalEntity : Identifiable {

}
