//
//  Username.swift
//  LoginScreen
//
//  Created by Yen Lu on 10/18/19.
//  Copyright © 2019 Yen Lu. All rights reserved.
//
/*
steps to make UI Table View:
 1. make an instance of UITableView
 2. add constraints
 3. set the tableView's delegate and data source
 4. register cell using reuseIdentifier
 5. make ViewController conform to UITableViewDelegate and UITableViewDataSource
 */

import Foundation
//swift library that contains all UI elements
import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView
    var posts: [[String]] = [
        ["sec1 post1", "sec1 post2", "sec1 post3"],
        ["sec2 post1", "sec2 post2", "sec2 post3", "sec2 post4"]
    ]
    
    init() {
        self.tableView = UITableView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpTableView()
    }
    
    func setUpTableView() {
        //add tableview as a subsview
        view.addSubview(tableView)
        
        //set translates autoresizing... = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //create our constraints
        let topConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let leftConstraint = tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        //activate constraints
        topConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
        bottomConstraint.isActive = true
        
        //set tableView's delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        //register cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "postCellId")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section: \(section)"
    }
    
//    func makeCell(indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellId", for: indexPath)
        cell.textLabel?.text = posts[indexPath.section][indexPath.row]
        return cell
    }
}
