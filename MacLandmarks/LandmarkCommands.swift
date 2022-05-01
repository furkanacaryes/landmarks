//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by Furkan on 2.05.2022.
//

import SwiftUI

struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove from Favorites" : "Mark as Favorite")") {
                selectedLandmark?.isFavorite.toggle()
            }
            .disabled(selectedLandmark == nil)
            .keyboardShortcut("f", modifiers: [.shift, .option])
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
