//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Mishoni Mihaylov on 19.12.24.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Couldn't find \(file)")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Couldn't read \(file)")
        }
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
