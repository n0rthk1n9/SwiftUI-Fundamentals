//
//  ModifiersChallenge2.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 02.10.23.
//

import SwiftUI

struct ModifiersChallenge2: View {
    var body: some View {
        VStack {
            Image(systemName: "sun.max.fill")
                .renderingMode(.original)
                .font(.system(size: 50))
                .padding(.bottom, 2)
            Text("Sunny")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.title)
            Text("H: 61° L: 44°")
                .foregroundColor(.white)
                .opacity(0.7)
        }
        .padding(15)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.white, Color.blue]),
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
    }
}

struct ModifiersChallenge2_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersChallenge2()
            .previewLayout(.sizeThatFits)
            .padding()

        VStack {
            Image("challenge 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 180)
        }
        .previewLayout(.sizeThatFits)
    }
}
