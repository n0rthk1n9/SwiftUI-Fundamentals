//
//  NavigationViews.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct NavigationViews: View {
    @State var artworks = artData

    var body: some View {
        NavigationView {
            List(artworks) { artwork in
                NavigationLink {
                    DetailView(artwork: artwork)
                } label: {
                    Text(artwork.title)
                }
            }
            .navigationTitle("Artworks")
            .listStyle(PlainListStyle())
            DetailView(artwork: artworks[0])
        }
    }
}

struct NavigationViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViews()
    }
}
