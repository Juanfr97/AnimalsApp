//
//  Animal.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import Foundation
import MapKit
struct Animal : Codable, Identifiable {
    let id : Int
    let name : String
    let image : String
    let description : String
    let headline : String
    let link : String
    let fact: [String]
    let gallery : [String]
    let latitude : Double
    let longitude : Double
    var location : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
