//
//  MovieList.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct MovieList: View {
    @StateObject var movieStore = MovieStore()
    @State private var isPresented = false
    @State private var isLookAndFeelPresented = false
    @EnvironmentObject var userStore: UserStore
    @ObservedObject var lookAndFeelStore = LookAndFeelStore()

    var body: some View {
        NavigationView {
            List {
                ForEach(movieStore.movies, id: \.title) {
                    MovieRow(lookAndFeelStore: lookAndFeelStore, movie: $0)
                }
                .onDelete(perform: movieStore.deleteMovie)
            }
            .sheet(isPresented: $isPresented) {
                AddMovie(lookAndFeelStore: lookAndFeelStore, movieStore: movieStore, showModal: $isPresented)
            }
            .sheet(isPresented: $isLookAndFeelPresented, content: {
                LookAndFeelView(lookAndFeelStore: lookAndFeelStore)
            })
            .navigationBarTitle(Text("Fave Flicks"))
            .navigationBarItems(
                leading:
                NavigationLink(destination: UserView()) {
                    HStack {
                        Text(userStore.currentUserInfo.userName)
                        Image(systemName: "person.fill")
                    }
                },
                trailing:
                HStack {
                    Button(action: { isLookAndFeelPresented.toggle() }) {
                        Image(systemName: "gear")
                    }
                    Button(action: { isPresented.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            )
        }
        .accentColor(lookAndFeelStore.currentLookAndFeel.accentColor)
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(movieStore: MovieStore())
            .environmentObject(UserStore())
    }
}
