//
//  ProductsPresenter.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import Foundation
import UIKit

class ProductsPresenter {
    
    private var collectionView: UICollectionView!
    private let datasource: ProductsDatasource<Recipe, ItemCollectionViewCell>
    private let recipeRepository: RecipeRepositoryInterface
    
    var wireframe: ProductsWireframeInterface?
    
    init(repository: RecipeRepositoryInterface = RecipeRepository(),
         wireframe: ProductsWireframeInterface = ProductsWireframe()) {
        self.datasource = ProductsDatasource()
        self.recipeRepository = repository
    }
    
    private func loadInformation() {
        recipeRepository.retrieveRecipe { [unowned self] result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case .success(let list):
                self.datasource.setItems(list)
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc
    private func orderButtonPressed() {
        
    }
    
    func registerInputs(collection: UICollectionView, orderButton: UIButton) {
        collectionView = collection
        collectionView.dataSource = datasource
        orderButton.target(forAction: #selector(orderButtonPressed),
                           withSender: nil)
        loadInformation()
    }
}
