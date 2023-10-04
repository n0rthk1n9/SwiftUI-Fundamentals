//
//  LookAndFeelView.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

let symbols = ["star", "rectangle", "triangle", "circle"]

struct LookAndFeelView: View {
    // TODO: reference the LookAndFeelStore here
    @ObservedObject var lookAndFeelStore = LookAndFeelStore()
    // TODO: You'll also need some @State properties here - views below need bindings
    @State private var accentColor: Color = .red
    @State private var symbolName: String = "star"

    var body: some View {
        NavigationView {
            Form {
                Section("Accent Color") {
                    ColorPicker("Accent Color", selection: $accentColor)
                }
                Section("Rating Symbol") {
                    Picker(selection: $symbolName, label: Text("Symbol")) {
                        ForEach(symbols, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Look and Feel"), displayMode: .inline)
            .navigationBarItems(
                trailing:
                Button(action: { updateLookAndFeelInfo() }
                ) {
                    Text("Update")
                }
            )
        }
        .onAppear {
            accentColor = lookAndFeelStore.currentLookAndFeel.accentColor
            symbolName = lookAndFeelStore.currentLookAndFeel.symbolName
        }
        // TODO: like the UserView, be sure to update thing in onAppear
    }

    func updateLookAndFeelInfo() {
        // TODO: update the store here
        let newLookAndFeel = LookAndFeelInfo(accentColor: accentColor, symbolName: symbolName)
        lookAndFeelStore.currentLookAndFeel = newLookAndFeel
    }
}

struct LookAndFeelView_Previews: PreviewProvider {
    static var previews: some View {
        LookAndFeelView()
    }
}
