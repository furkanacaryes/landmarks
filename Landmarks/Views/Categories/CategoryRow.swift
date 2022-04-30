//
//  CatogoryRow.swift
//  Landmarks
//
//  Created by Furkan on 30.04.2022.
//

import SwiftUI

struct CategoryRow: View {
    var categoryTitle: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryTitle)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryTitle: "Places You Should Visit",
            items: Array(landmarks.prefix(5))
        )
    }
}
