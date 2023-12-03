//
//  MapsView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import Foundation
import SwiftUI
import MapKit
struct MapsView: View {
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.60286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let animals: [Animal] = Bundle.main.decode("animals.json")

    
    var body: some View {
        //Map(coordinateRegion: $region)
        
        // MARK:  Map with annotations,
        Map(coordinateRegion: $region, annotationItems: animals) { animal in
            MapAnnotation(coordinate: animal.location) {
                MapAnnotationView(animal: animal)
            }
        }
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitud")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitud")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                }
            }
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(Color.black.cornerRadius(8)
                    .opacity(0.6))
                .padding()
                
            , alignment: .top)
    }
    
}

#Preview {
    MapsView()
}
