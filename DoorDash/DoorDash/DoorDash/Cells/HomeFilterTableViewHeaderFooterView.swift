//
//  HomeFilterTableViewHeaderFooterView.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

//class HomeFilterTableViewHeaderFooterView: UITableViewHeaderFooterView {
//
//    var filters = ["Pickup", "Ratings", "Under 30 min", "Price", "DashPass"]
//
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(UINib(nibName: FilterCollectionViewCell.cellId, bundle: nil), forCellWithReuseIdentifier: FilterCollectionViewCell.cellId)
//
//        contentView.addSubview(collectionView)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension HomeFilterTableViewHeaderFooterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return filters.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.cellId, for: indexPath) as? FilterCollectionViewCell {
//            cell.configureCell(title: filters[indexPath.item], backgroundColor: .ddGrey, image: nil, selected: false)
//            return cell
//        }
//        return UICollectionViewCell()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let cell = Bundle.main.loadNibNamed(FilterCollectionViewCell.nibName, owner: self)?.first as? FilterCollectionViewCell else {
//            return CGSize.zero
//        }
//        let data = filters[indexPath.item]
//        cell.configureCell(title: data, backgroundColor: .ddGrey, image: nil, selected: false)
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        return CGSize(width: size.width, height: 40)
//    }
//}
