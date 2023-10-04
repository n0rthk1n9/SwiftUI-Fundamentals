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
        List(artworks) { artwork in
            Text(artwork.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct NavigationViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViews()
    }
}
