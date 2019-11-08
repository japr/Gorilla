//
//  UICollectionViewCell+Additions.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import UIKit

protocol CellIdentifiable where Self: UICollectionViewCell {
    static func identifier() -> String
}

protocol ConfigurableCell where Self: UICollectionViewCell {
    associatedtype Element
    func configure(with item: Element)
}

extension UICollectionViewCell: CellIdentifiable {
    class func identifier() -> String {
        return String(describing: self) + "Identifier"
    }
}
