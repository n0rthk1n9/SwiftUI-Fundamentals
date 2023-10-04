//
//  FaveFlicks.swift
//  SwiftUI-Fundamentals
//
//  Created by Jan Armbrust on 04.10.23.
//

import SwiftUI

struct FaveFlicks: View {
    var body: some View {
        MovieList()
            .environmentObject(UserStore())
    }
}

#Preview {
    FaveFlicks()
}
