//
//  UITableView_Ext.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/12/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
