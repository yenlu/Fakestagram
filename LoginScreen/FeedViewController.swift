//
//  Username.swift
//  LoginScreen
//
//  Created by Yen Lu on 10/18/19.
//  Copyright © 2019 Yen Lu. All rights reserved.
//

import Foundation
import UIKit

struct InstaPost: Codable {
    var caption: String
    var user: String
}

struct PostResponse: Codable {
    var posts: [InstaPost]
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView
    var posts: [InstaPost] = []
    
//    var posts: [Post] = [
//        Post(image: UIImage(named: "pancakes.png")!, caption: "pancakes"),
//        Post(image: UIImage(named: "cookies.png")!, caption: "cookies"),
//        Post(image: UIImage(named: "oreos.png")!, caption: "oreos"),
//        Post(image: UIImage(named: "cupcake.png")!, caption: "cupcake")
//    ]
    
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
        getInstaPosts()
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellId", for: indexPath) as! PostTableViewCell
//
//        cell.postImageView.image = posts[indexPath.row].image
//        cell.postCaption.text = posts[indexPath.row].caption
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellId", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].caption

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
    }
    
    func getInstaPosts() {
        //url that we will make the request to
        guard let url = URL(string: "https://api.myjson.com/bins/1djp56") else {
            print("invalid url")
            return
        }
        
        //create the request object using our url
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            //checking if error not nil, if not, execute
            if let error = error { //error is not null/exists
                print("There was an error")
                return
            }
            
            //guarding to make sure data is not nil, execute if nil
            guard let data = data else {
                print("data is nil")
                return
            }
            print(data)
            let decoder = JSONDecoder()
            
            do {
                let postResponse = try decoder.decode(PostResponse.self, from: data)
//                print(postResponse)
                
//                for post in postResponse.posts {
//                    print(post.caption)
//                }
                
                self.posts = postResponse.posts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print ("there was an error")
            }
        }
        task.resume()
//        //executed first in slow internet
//        print("sadkjfb")
    }
}
