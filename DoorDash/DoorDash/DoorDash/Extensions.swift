//
//  Extensions.swift
//  DoorDash
//
//  Created by Ying Yang on 8/1/22.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var cellId: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var cellId: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    static var cellId: String {
        return String(describing: self)
    }
}
