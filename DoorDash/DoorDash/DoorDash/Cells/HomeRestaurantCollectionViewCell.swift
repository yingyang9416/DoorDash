//
//  HomeRestaurantCollectionViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class HomeRestaurantCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var numberOfRatingsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 5
    }
    
    func bind(restaurant: Restaurant) {
        imageView.image = restaurant.image
        nameLabel.text = restaurant.name
        infoLabel.text = "\(restaurant.distance) mi • \(restaurant.eta) min • $\(restaurant.deliveryFee) delivery fee"
        ratingLabel.text = "\(restaurant.ratings)"
        numberOfRatingsLabel.text = "(\(restaurant.numberOfRatings))"
        
    }

}
