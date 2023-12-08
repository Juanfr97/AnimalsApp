//
//  SharedData.swift
//  Animals
//
//  Created by Juan Frausto on 05/12/23.
//

import Foundation
import Combine
class SharedData: ObservableObject {
    @Published var shouldRefreshAnimals = PassthroughSubject<Void, Never>()
}
