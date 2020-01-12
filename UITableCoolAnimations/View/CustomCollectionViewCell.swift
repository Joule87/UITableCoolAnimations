//
//  CustomCollectionViewCell.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/12/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static let reuseIdentifier = "CustomCollectionViewCell"
 
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? UIColor.airGray : UIColor.lightGray
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? UIColor.airGray : UIColor.lightGray
        }
    }
}

