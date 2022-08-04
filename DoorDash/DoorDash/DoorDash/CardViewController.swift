//
//  CardViewController.swift
//  DoorDash
//
//  Created by Ying Yang on 7/30/22.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var handleBar: UIView!
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HomeRestaurantTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: HomeRestaurantTableViewCell.cellId)
        handleBar.layer.cornerRadius = 2
    }
    
}

extension CardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeRestaurantTableViewCell.cellId, for: indexPath) as? HomeRestaurantTableViewCell {
            cell.bind(title: homeData[indexPath.row].title, restaurants: homeData[indexPath.row].restaurants)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
}
