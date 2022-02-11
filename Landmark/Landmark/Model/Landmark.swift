//
//  Landmark.swift
//  Landmark
//
//  Created by Hanif Pramono on 13/04/21.
//

import Foundation
import SwiftUI
// Importing MapKit framework... I guess
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    
    // These are to reference key info in the .json file
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    // marking user's favorite landmarks
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // This is basically just telling to read the name of the image from the data, and a computed image property that loads an image from the asset catalog
    // the property should be private because users of the Landmarks structure care only about the image itself
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    // Compute a locationCoordinate property that's useful for interacting with the MapKit framework
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    
    
    // Adds a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure
    // Marking it private because will only use it only to create public computed property after this
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
