//
//  Data+Helpers.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

extension Data {
    func decode<T: Decodable>(type: T.Type = T.self) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decoded = try decoder.decode(type, from: self)
            return decoded
        } catch {
            print("❗DECODING ERROR❗: \(error)")
            throw error
        }
    }
}
