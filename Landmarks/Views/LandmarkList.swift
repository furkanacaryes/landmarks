//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Furkan on 12.01.2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Show Only Favorites")
                    }
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
           LandmarkList()
               .previewDevice(PreviewDevice(rawValue: deviceName))
               .previewDisplayName(deviceName)
        }
        .environmentObject(ModelData())
    }
}
