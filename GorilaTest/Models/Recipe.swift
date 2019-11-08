//
//  Recipe.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import Foundation

struct Recipe {
    let name: String
    let lastname: String
    let price: String
    let color: String
    let type: String
}

extension Recipe: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "name1"
        case lastname = "name2"
        case price
        case color = "bg_color"
        case type
    }
}
