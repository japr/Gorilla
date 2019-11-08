//
//  ItemCollectionViewCell.swift
//  GorilaTest
//
//  Created by Jorge Palacio on 8/11/19.
//  Copyright © 2019 Jorge Palacio. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemPrice: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        itemName.text = nil
        itemPrice.text = nil
    }
}

extension ItemCollectionViewCell: ConfigurableCell {
    typealias Element = Recipe

    func configure(with item: Recipe) {
        imageView.image = UIImage(named: item.type)
        itemName.text = item.name+" "+item.lastname
        itemPrice.text = item.price
        imageView.backgroundColor = UIColor(hexString: item.color)
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
}
