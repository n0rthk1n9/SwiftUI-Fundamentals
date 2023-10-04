//
//  GenrePicker.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct GenrePicker: View {
    @Binding var genre: Genre

    var body: some View {
        Picker(selection: $genre, label: Spacer()) {
            ForEach(Genre.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(WheelPickerStyle())
    }
}

struct GenrePicker_Previews: PreviewProvider {
    static var previews: some View {
        GenrePicker(genre: .constant(.action))
    }
}
