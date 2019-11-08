//
//  NetworkInterface.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
}

enum NetworkStatus {
    case notReachable
    case reachable
}

typealias NetworkStatusChangesCallback = (NetworkStatus) -> Void
typealias ResponseDataCallback = (Swift.Result<Data, Error>) -> Void

protocol NetworkInferface {
    func get(_ path: String, parameters: [String: Any]?, _ callback: @escaping ResponseDataCallback)
}
