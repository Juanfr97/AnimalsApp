//
//  HeadingView.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import SwiftUI

struct HeadingView: View {
    var headingImage : String
    var headingText : String
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}
