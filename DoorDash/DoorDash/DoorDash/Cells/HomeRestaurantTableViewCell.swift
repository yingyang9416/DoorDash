//
//  HomeRestaurantTableViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class HomeRestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    @IBOutlet weak var arrowView: UIView!
    
    var restaurants = [Restaurant]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowView.layer.cornerRadius = 16
        restaurantCollectionView.register(UINib(nibName: HomeRestaurantCollectionViewCell.cellId, bundle: nil), forCellWithReuseIdentifier: HomeRestaurantCollectionViewCell.cellId)

        restaurantCollectionView.delegate = self
        restaurantCollectionView.dataSource = self
    }

    func bind(title: String, restaurants: [Restaurant]) {
        titleLabel.text = title
        self.restaurants = restaurants
        restaurantCollectionView.reloadData()
    }
}

extension HomeRestaurantTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRestaurantCollectionViewCell.cellId, for: indexPath) as? HomeRestaurantCollectionViewCell {
            let res = restaurants[indexPath.item]
            cell.bind(restaurant: res)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
