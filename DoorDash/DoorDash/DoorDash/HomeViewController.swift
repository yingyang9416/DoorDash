//
//  HomeViewController.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        APICaller(url: "", httpMethod: .GET).fetchData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: AddressTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: AddressTableViewCell.cellId)
        tableView.register(UINib(nibName: HomeCatalogTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: HomeCatalogTableViewCell.cellId)
        tableView.register(UINib(nibName: FoodCatalogTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: FoodCatalogTableViewCell.cellId)
        tableView.register(UINib(nibName: HomeFilterTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: HomeFilterTableViewCell.cellId)
        tableView.register(UINib(nibName: HomeRestaurantTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: HomeRestaurantTableViewCell.cellId)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        case 3:
            return 1
        case 4:
            return homeData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.cellId, for: indexPath) as? AddressTableViewCell {
                return cell
            } else {
                return UITableViewCell()
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeCatalogTableViewCell.cellId, for: indexPath) as? HomeCatalogTableViewCell {
                return cell
            } else {
                return UITableViewCell()
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FoodCatalogTableViewCell.cellId, for: indexPath) as? FoodCatalogTableViewCell {
                return cell
            } else {
                return UITableViewCell()
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeFilterTableViewCell.cellId, for: indexPath) as? HomeFilterTableViewCell {
                return cell
            } else {
                return UITableViewCell()
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeRestaurantTableViewCell.cellId, for: indexPath) as? HomeRestaurantTableViewCell {
                cell.bind(title: homeData[indexPath.row].title, restaurants: homeData[indexPath.row].restaurants)
                return cell
            } else {
                return UITableViewCell()
            }

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 30
        case 1:
            return 100
        case 2:
            return 100
        case 3:
            return 40
        case 4:
            return 280
        default:
            return 0
        }
    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 3 {
//            if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeFilterTableViewHeaderFooterView.cellId) as? HomeFilterTableViewHeaderFooterView {
//                return view
//            }
//        }
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 3 {
//            return 40
//        }
//        return 0
//    }
}
