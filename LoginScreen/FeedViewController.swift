//
//  Username.swift
//  LoginScreen
//
//  Created by Yen Lu on 10/18/19.
//  Copyright © 2019 Yen Lu. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView
    var posts: [Post] = [
        Post(image: UIImage(named: "pancakes.png")!, caption: "pancakes"),
        Post(image: UIImage(named: "cookies.png")!, caption: "cookies"),
        Post(image: UIImage(named: "oreos.png")!, caption: "oreos"),
        Post(image: UIImage(named: "cupcake.png")!, caption: "cupcake")
    ]
    
    init(){
        self.tableView = UITableView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        for constraint in constraints {
            constraint.isActive = true
        }
        
        //the data source becomes the feedviewcontroller
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "postCellId")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "customCellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellId", for: indexPath) as! PostTableViewCell
        
        cell.postImageView.image = posts[indexPath.row].image
        cell.postCaption.text = posts[indexPath.row].caption
        
//        cell.textLabel?.text =  posts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
    }
}
