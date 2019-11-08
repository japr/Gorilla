//
//  ProductsViewController.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var orderButton: UIButton!
    
    var productsPresenter = ProductsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productsPresenter.registerInputs(collection: collectionView, orderButton: orderButton)
    }
    
}
