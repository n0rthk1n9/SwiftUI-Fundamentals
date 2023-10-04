//
//  DetailView.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct DetailView: View {
    let artwork: Artwork
  
    var body: some View {
        VStack {
            Text(artwork.title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .lineLimit(3)
      
            Button(action: {}) {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "mappin.and.ellipse")
          
                    Text(artwork.locationName)
                        .font(.headline)
                }
            }
      
            Text("Artist: \(artwork.artist)")
                .font(.subheadline)
      
            Image(artwork.imageName)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 600)
                .aspectRatio(contentMode: .fit)
      
            Divider()
      
            Text(artwork.description)
                .multilineTextAlignment(.leading)
                .lineLimit(20)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(artwork: artData[0])
    }
}
