//
//  UITableViewExtension.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit

extension UITableView {
    func register(cells: [String]) {
        cells.forEach({ self.register(UINib.init(nibName: $0, bundle: nil), forCellReuseIdentifier: $0) })
    }
}
