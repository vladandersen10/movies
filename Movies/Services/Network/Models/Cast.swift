//
//  Cast.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import Foundation

struct Cast: Decodable {
    enum DepartmentType: String, Decodable {
        case acting = "Acting"
        
        case unknown
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(RawValue.self)
            let value = Self(rawValue: rawValue)
            self = value ?? .unknown
        }
    }

    let name: String
    let knownForDepartment: DepartmentType
    let profilePath: String?
}
