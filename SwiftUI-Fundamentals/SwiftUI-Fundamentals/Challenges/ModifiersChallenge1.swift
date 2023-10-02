//
//  ModifiersChallenge1.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 02.10.23.
//

import SwiftUI

struct ModifiersChallenge1: View {
    var body: some View {
        Image("monster")
            .resizable()
            .scaledToFit()
            .shadow(radius: 15)
            .border(Color.green, width: 6.0)
            .padding()
    }
}

struct ModifiersChallenge1_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersChallenge1()
        Image("challenge 1")
            .resizable()
            .scaledToFill()
    }
}
