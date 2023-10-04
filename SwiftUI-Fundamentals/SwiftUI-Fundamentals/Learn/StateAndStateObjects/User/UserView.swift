//
//  UserView.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct UserView: View {
    @State private var userName = ""
    @State private var favoriteGenre = Genre.action
    @ObservedObject var userStore: UserStore

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User")) {
                    TextField("User Name", text: $userName)
                }
                Section(header: Text("Favorite Genre")) {
                    GenrePicker(genre: $favoriteGenre)
                }
            }
        }
        .navigationBarTitle(Text("\(userName) Info"), displayMode: .inline)
        .navigationBarItems(
            trailing:
            Button(action: { updateUserInfo() }) {
                Text("Update")
            }
        )
        .onAppear {
            userName = userStore.currentUserInfo.userName
            favoriteGenre = userStore.currentUserInfo.favoriteGenre
        }
    }

    func updateUserInfo() {
        let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
        userStore.currentUserInfo = newUserInfo
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userStore: UserStore())
    }
}
