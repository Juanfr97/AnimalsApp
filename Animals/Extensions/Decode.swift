//
//  Decode.swift
//  Animals
//
//  Created by Juan Frausto on 30/11/23.
//

import Foundation

extension Bundle {
    func decode<T:Codable>(_ file:String) -> T {
        // 1. Locate Json File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Faild to load \(file) from bundle")
        }
        // 3. Create decoder
        let decoder = JSONDecoder()
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from bundle")
        }
        // 6. Return the ready to use data
        return loaded
    }
}
