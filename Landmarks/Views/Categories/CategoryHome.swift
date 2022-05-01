//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Furkan on 30.04.2022.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isProfileVisible = false

    var body: some View {
        NavigationView {
            List {
                modelData.featuredLandmarks[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { categoryTitle in
                    CategoryRow(
                        categoryTitle: categoryTitle,
                        items: modelData.categories[categoryTitle]!
                    )
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    isProfileVisible.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $isProfileVisible) {
                ProfileHost()
//                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
