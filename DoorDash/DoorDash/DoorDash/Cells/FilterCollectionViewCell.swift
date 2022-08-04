//
//  MapFilterCollectionViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 7/31/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let reuseIdentifier = "FilterCollectionViewCell"
    static let nibName = "FilterCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.backgroundColor = .clear
        containerView.layer.cornerRadius = 16
        
    }
    
    func configureCell(filter: Filter, shadowed: Bool) {
        titleLabel.text = filter.title
        containerView.backgroundColor = filter.selected ? filter.selectedBackgroundColor : filter.normalBackgroundColor
        titleLabel.textColor = filter.selected ? .white : .black
        imageView.isHidden = filter.normalImage == nil
        imageView.image = filter.selected ? filter.selectedImage : filter.normalImage
        if shadowed {
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowOffset = .zero
            containerView.layer.shadowRadius = 3
        }
    }

}
