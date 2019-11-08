//
//  ProductsDataSource.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import UIKit

class ProductsDatasource<Element: Codable, Cell: ItemCollectionViewCell>: NSObject, UICollectionViewDataSource where Cell.Element == Element {
    
    private(set) var items: [Element] = []

    func setItems(_ items: [Element]) {
        self.items = items
    }

    func itemAt(indexPath: IndexPath) -> Element {
        return items[indexPath.item]
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier(), for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        guard let element = items[indexPath.item] as? Recipe else {
            return cell
        }
        cell.configure(with: element)
        return cell
    }
}
