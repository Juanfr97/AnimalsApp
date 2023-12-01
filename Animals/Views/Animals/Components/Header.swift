//
//  Header.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct Header: View {
    // MARK:  - PROPERTIES,
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    // MARK:  - BODY,
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
        } // : END OF TABS
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    Header()
}
