//
//  ContentView.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 02.10.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Howdy, world!")
                .kerning(5.0)
                .fontWeight(.bold)
            Image(systemName: "swift")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .padding()
                .background(Color.orange)
                .padding([.leading, .bottom, .trailing])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
