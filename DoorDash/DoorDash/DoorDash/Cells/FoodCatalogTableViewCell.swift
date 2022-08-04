//
//  FoodCatalogTableViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class FoodCatalogTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dummyData = [("Burger", UIImage(named: "burger")),
                     ("Fondue", UIImage(named: "fondue")),
                     ("Seafood", UIImage(named: "seafood")),
                     ("Pizza", UIImage(named: "pizza")),
                     ("Taco", UIImage(named: "taco")),
                     ("Dessert", UIImage(named: "dessert")),
                     ("Fruit", UIImage(named: "fruit"))]

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: FoodCatalogCollectionViewCell.cellId, bundle: nil), forCellWithReuseIdentifier: FoodCatalogCollectionViewCell.cellId)
    }
}

extension FoodCatalogTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCatalogCollectionViewCell.cellId, for: indexPath) as? FoodCatalogCollectionViewCell {
            let data = dummyData[indexPath.item]
            if let image = data.1 {
                cell.congifureCell(title: data.0, image: image)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 0)
    }
}

