//
//  Animator.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/12/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

class Animator {
    
    private var hasAnimatedAllCells = false
    private let animation: Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else {
            return
        }

        animation(cell, indexPath, tableView)

        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
    
}
