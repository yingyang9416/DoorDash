//
//  HomeCatalogCollectionViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class HomeCatalogCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newTagView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageContainer.layer.cornerRadius = 30
        newTagView.layer.cornerRadius = 4
        imageContainer.clipsToBounds = true
    }
    
    func congifureCell(title: String, image: UIImage, newTag: Bool) {
        newTagView.isHidden = !newTag
        titleLabel.text = title
        imageView.image = image
    }

}
