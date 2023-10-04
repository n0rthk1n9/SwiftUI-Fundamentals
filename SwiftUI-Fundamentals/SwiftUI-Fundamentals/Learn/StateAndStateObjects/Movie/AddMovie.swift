//
//  AddMovie.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct AddMovie: View {
    @ObservedObject var lookAndFeelStore: LookAndFeelStore
    static let defaultMovieTitle = "An untitled masterpiece"

    let movieStore: MovieStore
    @Binding var showModal: Bool
    @State private var title = ""
    @State private var genre = Genre.action
    @State private var rating: Double = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Rating")) {
                    Slider(value: $rating, in: 0 ... 5, step: 0.5)
                    RatingView(lookAndFeelStore: lookAndFeelStore, rating: rating)
                }
                Section(header: Text("Genre")) {
                    GenrePicker(genre: $genre)
                }
            }
            .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
            .navigationBarItems(
                trailing:
                Button(action: addMovie) {
                    Text("Add")
                }
            )
        }
    }

    private func addMovie() {
        movieStore.addMovie(
            title: title.isEmpty ? AddMovie.defaultMovieTitle : title,
            genre: genre,
            rating: rating
        )

        showModal.toggle()
    }
}
