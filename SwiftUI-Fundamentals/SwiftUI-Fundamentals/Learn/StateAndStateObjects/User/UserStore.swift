//
//  UserStore.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import Combine

class UserStore: ObservableObject {
    @Published var currentUserInfo = UserInfo(userName: "Movie Lover", favoriteGenre: .action)
}

struct UserInfo {
    let userName: String
    let favoriteGenre: Genre
}
