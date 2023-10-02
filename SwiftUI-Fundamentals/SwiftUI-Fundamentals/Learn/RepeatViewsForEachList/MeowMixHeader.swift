//
//  MeowMixHeader.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 02.10.23.
//

import SwiftUI

struct MeowMixHeader: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 20) {
            RepeatViewsForEachListThumbnail()
            VStack(alignment: .leading) {
                RepeatViewsForEachListMixDescription()
                RepeatViewsForEachListButtons()
            }
        }
        .frame(minHeight: 150, maxHeight: 250)
    }
}

struct RepeatViewsForEachListThumbnail: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(radius: 10)

                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .opacity(0.4)
            }

            VStack(alignment: .leading) {
                Text("Meow!")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Text("Mix")
                    .font(.largeTitle)

                Spacer()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct RepeatViewsForEachListMixDescription: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            VStack(alignment: .leading) {
                Text("Meow! Mix")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Music for Luna")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.accentColor)
                Text("Updated Caturday")
                    .font(Font.system(.body).smallCaps())
            }

            Text("Whether you're a kitten or an old-timer, get meowing with this purrsonalized mix of music to meow to!")
        }
    }
}

struct RepeatViewsForEachListButtons: View {
    var body: some View {
        HStack(spacing: 20.0) {
            Button { print("Play!") }
                label: { RepeatViewsForEachListButtonLabel(title: "Play", systemImage: "play.fill") }

            Button { print("Shuffle!") }
                label: { RepeatViewsForEachListButtonLabel(title: "Shuffle", systemImage: "shuffle") }
        }
    }
}

struct RepeatViewsForEachListButtonLabel: View {
    let title: String
    let systemImage: String

    var body: some View {
        HStack {
            Spacer()
            Label(title, systemImage: systemImage)
            Spacer()
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(6)
    }
}

struct RepeatViewsForEachListMeowMixHeader_Previews: PreviewProvider {
    static var previews: some View {
        MeowMixHeader()
            .previewLayout(.sizeThatFits)

        RepeatViewsForEachListThumbnail()
            .padding()
            .previewLayout(.fixed(width: 250, height: 250))

        RepeatViewsForEachListButtons()
            .previewLayout(.sizeThatFits)

        RepeatViewsForEachListMixDescription()
            .previewLayout(.sizeThatFits)
    }
}
