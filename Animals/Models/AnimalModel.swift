//
//  AnimalModel.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import Foundation
import MapKit
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
    
    var description : String {
        animal.descriptions ?? ""
    }
    
    var headline : String {
        animal.headline ?? ""
    }
    
    var galleries : [String]{
        animal.galleryArray.map{ gallery in
            gallery.unwrappedImage
        }
    }
    
    var facts : [String]{
        animal.factsArray.map{ fact in
            fact.unwrappedFact
        }
    }
    
    var image : String {
        animal.image ?? ""
    }
    
    var location : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: animal.latitude, longitude: animal.longitude)
    }
}
