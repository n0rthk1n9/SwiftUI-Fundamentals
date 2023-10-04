//
//  MovieRow.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct MovieRow: View {
    @ObservedObject var lookAndFeelStore: LookAndFeelStore
    let movie: Movie

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.light)
                Text(movie.genre.rawValue)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                RatingView(lookAndFeelStore: lookAndFeelStore, rating: movie.rating)
            }
        }
    }
}
