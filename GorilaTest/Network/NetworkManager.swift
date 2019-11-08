//
//  NetworkManager.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {

    private let environment: Environment
    private let sessionManager: Alamofire.SessionManager

    static let `default` = NetworkManager()

    init(environment: Environment = .dev) {
        self.environment = environment
        let configuration = URLSessionConfiguration.default
        configuration.multipathServiceType = .none
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
}

extension NetworkManager: NetworkInferface {

    func get(_ path: String, parameters: [String: Any]? = nil, _ callback: @escaping ResponseDataCallback) {
        guard let url = URL(string: environment.path + path) else {
            callback(.failure(NetworkError.badURL))
            return
        }
        sessionManager
        .request(
            url,
            method: Alamofire.HTTPMethod.get,
            parameters: parameters,
            encoding: Alamofire.URLEncoding.default
        ).responseData { (response) in
            switch response.result {
            case let .failure(error): callback(.failure(error))
            case let .success(value): callback(.success(value))
            }
        }
    }
}
