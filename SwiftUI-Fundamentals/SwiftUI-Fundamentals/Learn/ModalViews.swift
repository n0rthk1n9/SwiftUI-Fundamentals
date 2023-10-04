//
//  ModalViews.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct ModalViews: View {
    @State var artworks = artData

    var body: some View {
        NavigationStack {
            List(artworks) { artwork in
                NavigationLink(value: artwork) {
                    Text(artwork.title)
                }
            }
            .navigationTitle("Artworks")
            .navigationDestination(for: Artwork.self, destination: { artwork in
                DetailView(artwork: artwork)
            })
            .listStyle(PlainListStyle())
        }
    }
}

struct ModalViews_Previews: PreviewProvider {
    static var previews: some View {
        ModalViews()
    }
}
