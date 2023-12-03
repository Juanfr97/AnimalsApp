//
//  View.swift
//  Animals
//
//  Created by Juan Frausto on 03/12/23.
//

import Foundation
import SwiftUI
extension View {
    func centerHorizontally() -> some View {
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
}
