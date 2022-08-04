//
//  FoodCatalogCollectionViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class FoodCatalogCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func congifureCell(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }

}
