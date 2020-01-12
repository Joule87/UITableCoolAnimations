//
//  ViewController.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/11/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cellContent : [String]?
    let tableViewCellId = "tableViewCellId"
    var selectedAnimation: Int = 0 {
        didSet {
            isFirstLoad = true
        }
    }
    var isFirstLoad = true
    
    private let animationFactory = AnimationFactory()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let animationView: AnimationsView = {
        let animationsView = AnimationsView()
        animationsView.translatesAutoresizingMaskIntoConstraints = false
        return animationsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableViewContent()
        setupUIElements()
        
    }
    
    private func setupTableViewContent() {
        cellContent = [String]()
        for index in 0..<1000 {
            let text = "Cell number \(index) with some cool animation"
            cellContent?.append(text)
        }
    }
    
    private func setupAnimationSelectorView() {
        animationView.delegate = self
        view.addSubview(animationView)
        [animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         animationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         animationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         animationView.heightAnchor.constraint(equalToConstant: 75)].forEach{ $0.isActive = true}
    }
    
    func setupUIElements() {
        setupAnimationSelectorView()
        setupUITableView()
    }
    
    private func setupUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        view.addSubview(tableView)
        [tableView.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 8),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach{ $0.isActive = true}
    }
    
}

extension ViewController: AnimationsViewDelegate {
    func didSelectAnimation(index: Int) {
        selectedAnimation = index
        tableView.contentOffset = CGPoint.zero
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId)!
        cell.textLabel?.text = cellContent?[indexPath.row]
        let randomColor = UIColor.getRandomColor()
        cell.backgroundColor = randomColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let animation = animationFactory.getAnimation(for: selectedAnimation,isFirstLoad: isFirstLoad) else { return }
        
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
        
        if tableView.isLastVisibleCell(at: indexPath) {
            isFirstLoad = false
        }
    }
    
}
