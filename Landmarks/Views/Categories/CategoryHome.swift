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
                PageView(pages: modelData.featuredLandmarks.map {
                    FeatureCard(landmark: $0)
                })
                .aspectRatio(3/2, contentMode: .fit)
                .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { categoryTitle in
                    CategoryRow(
                        categoryTitle: categoryTitle,
                        items: modelData.categories[categoryTitle]!
                    )
                    .padding(.top, 16)
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
