//
//  API.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import Foundation

protocol EnvironmentPath {
    var path: String { get }
}

enum Environment {
    case dev
}

extension Environment: EnvironmentPath {
    var path: String {
        switch self {
        case .dev:  return "https://gl-endpoint.herokuapp.com"
        }
    }
}

protocol EndpointPath {
    var path: String { get }
}

enum Endpoints {
    case products
}

extension Endpoints: EndpointPath {
    var path: String {
        switch self {
        case .products: return "/products"
        }
    }
}
