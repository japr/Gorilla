//
//  RecipeRepository.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import Foundation

enum RecipeRepositoryError: Error {
    case deserializationFailed
    case networkCallFailed
}

typealias RecipeResponseCallback = (Swift.Result<[Recipe], RecipeRepositoryError>) -> Void

protocol RecipeRepositoryInterface {
    func retrieveRecipe(callBack: @escaping RecipeResponseCallback)
}

class RecipeRepository {

    private let network: NetworkInferface

    init(network: NetworkInferface = NetworkManager.default) {
        self.network = network
    }
}

extension RecipeRepository: RecipeRepositoryInterface {
    func retrieveRecipe(callBack: @escaping RecipeResponseCallback) {
        network.get(Endpoints.products.path, parameters: nil) { result in
            switch result {
            case .failure(_):
                callBack(.failure(.networkCallFailed))
            case let .success(data):
                do {
                    let recipeList = try JSONDecoder().decode([Recipe].self, from: data)
                    callBack(.success(recipeList))
                } catch {
                    callBack(.failure(.deserializationFailed))
                }
            }
        }
    }
}
