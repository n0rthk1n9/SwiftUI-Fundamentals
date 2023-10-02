//
//  StateAndBinding.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 02.10.23.
//

import SwiftUI

struct StateAndBinding: View {
    @State private var swiftyColor: Color = .red
    @State private var swiftyOpacity: Double = 0.7

    var body: some View {
        VStack {
            SwiftyControls(swiftyColor: $swiftyColor, swiftyOpacity: $swiftyOpacity)
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .padding(25)
                .foregroundColor(.white)
                .opacity(swiftyOpacity)
                .background(swiftyColor)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct StateAndBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateAndBinding()
    }
}

struct SwiftyControls: View {
    @Binding var swiftyColor: Color
    @Binding var swiftyOpacity: Double

    var body: some View {
        VStack {
            ColorPicker("Swifty Color", selection: $swiftyColor)
            Slider(value: $swiftyOpacity, in: 0 ... 1)
                .tint(swiftyColor)
        }
    }
}
