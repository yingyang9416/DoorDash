//
//  HomeCatalogTableViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class HomeCatalogTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dummyData = [("Alcohol", UIImage(named: "alcohol"), false),
                     ("Grocery", UIImage(named: "grocery"), false),
                     ("DashPass Deals", UIImage(named: "dashPass"), true),
                     ("Pets", UIImage(named: "pets"), false),
                     ("Offers", UIImage(named: "discounts"), false),
                     ("Gifts", UIImage(named: "gifts"), false)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: HomeCatalogCollectionViewCell.cellId, bundle: nil), forCellWithReuseIdentifier: HomeCatalogCollectionViewCell.cellId)
    }
    
}

extension HomeCatalogTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCatalogCollectionViewCell.cellId, for: indexPath) as? HomeCatalogCollectionViewCell {
            let data = dummyData[indexPath.item]
            if let image = data.1 {
                cell.congifureCell(title: data.0, image: image, newTag: data.2)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
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
