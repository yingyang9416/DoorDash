//
//  HomeFilterTableViewCell.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class HomeFilterTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dummyFilters: [Filter] =
    [Filter(title: "Open now", normalBackgroundColor: .ddLightGrey, selectedBackgroundColor: .black, selected: false),
     Filter(title: "DashPass", normalImage: UIImage(named: "doorDash"), selectedImage: UIImage(named: "doorDash-white"), normalBackgroundColor: .ddLightGrey, selectedBackgroundColor: .black, selected: false),
     Filter(title: "Ratings", normalImage: UIImage(named: "star-black"), selectedImage: UIImage(named: "star-white"), normalBackgroundColor: .ddLightGrey, selectedBackgroundColor: .black, selected: false),
     Filter(title: "Pickup", normalBackgroundColor: .ddLightGrey, selectedBackgroundColor: .black, selected: false),
     Filter(title: "Price", normalBackgroundColor: .ddLightGrey, selectedBackgroundColor: .black, selected: false)]

    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: FilterCollectionViewCell.nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension HomeFilterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyFilters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as? FilterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = dummyFilters[indexPath.item]
        cell.configureCell(filter: data, shadowed: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dummyFilters[indexPath.item].selected = !dummyFilters[indexPath.item].selected
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = Bundle.main.loadNibNamed(FilterCollectionViewCell.nibName, owner: self)?.first as? FilterCollectionViewCell else {
            return CGSize.zero
        }
        let data = dummyFilters[indexPath.item]
        cell.configureCell(filter: data, shadowed: false)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }


}
