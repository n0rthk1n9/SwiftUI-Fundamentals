//
//  LocationMap.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import MapKit
import SwiftUI

struct LocationMap: View {
    var artwork: Artwork
    @State var region = MKCoordinateRegion()

    var body: some View {
        VStack {
            HStack {
                Text(self.artwork.locationName)
            }
            .padding()

            Map(coordinateRegion: $region, annotationItems: [artwork]) { artwork in
                MapMarker(coordinate: artwork.coordinate)
            }
            .ignoresSafeArea()
            .onAppear {
                region.center = artwork.coordinate
                region.span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            }
        }
    }
}

struct LocationMap_Previews: PreviewProvider {
    static var previews: some View {
        LocationMap(artwork: artData[0])
    }
}
