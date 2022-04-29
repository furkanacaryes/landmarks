//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Furkan on 29.04.2022.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FavoriteButton(isSet: .constant(false))
            FavoriteButton(isSet: .constant(true))
        }
    }
}
