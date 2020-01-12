//
//  Animations.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/11/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class AnimationsView: UIView {
    
    var delegate: AnimationsViewDelegate?

    let animationLabel: UILabel = {
        let label = UILabel()
        label.text = "Select an animation"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNext-Bold", size: 25)
        return label
    }()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        addSubview(animationLabel)
        [animationLabel.topAnchor.constraint(equalTo: topAnchor),
        animationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        animationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        animationLabel.heightAnchor.constraint(equalToConstant: 25)].forEach{ $0.isActive = true}
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        [collectionView.topAnchor.constraint(equalTo: animationLabel.bottomAnchor, constant: 8),
         collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
         collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
         collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)].forEach{ $0.isActive = true}
        
    }
    
}

extension AnimationsView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Animations.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWith = (frame.width - 16) / 4
        return CGSize(width: cellWith, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        
        title.text = Animations(rawValue: indexPath.row)?.description
        title.font = UIFont(name: "AvenirNext-Bold", size: 15)
        title.textAlignment = .center
        
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10
        cell.contentView.addSubview(title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let animation = Animations(rawValue: indexPath.row) {
            delegate?.didSelectAnimation(index: animation.rawValue)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    
}
