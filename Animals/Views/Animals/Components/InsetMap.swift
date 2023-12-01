//
//  InsetMap.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI
import MapKit


struct InsetMap: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:6.60286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
        var body: some View {
            Map(coordinateRegion: $region)
                .overlay(
                    NavigationLink(destination: MapsView(), label: {
                        HStack{
                            Image(systemName: "mappin.circle")
                                .foregroundColor(Color.white)
                                .imageScale(.large)
                            Text("Localizaciones")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                            
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal,14)
                        .background(Color.black)
                        .opacity(0.4)
                        .cornerRadius(8)
                    }
                                  
                )
                    .padding(12),alignment: .topTrailing
                )
                .frame(height: 256)
                .cornerRadius(12)
        }
}


#Preview {
    InsetMap()
}
