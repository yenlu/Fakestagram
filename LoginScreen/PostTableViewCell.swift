//
//  PostTableViewCell.swift
//  LoginScreen
//
//  Created by Yen Lu on 11/8/19.
//  Copyright © 2019 Yen Lu. All rights reserved.
//

import UIKit

struct Post {
    let image: UIImage
    let caption: String
}

class PostTableViewCell: UITableViewCell {
    var postImageView: UIImageView
    var postCaption: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        postImageView = UIImageView()
        postCaption = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpImageView()
        setUpCaptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpImageView() {
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        postImageView.backgroundColor = .lightGray
        
        let constraints = [
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            postImageView.heightAnchor.constraint(equalToConstant: 400)
        ]
        
        for c in constraints {
            c.isActive = true
        }
    }
    
    func setUpCaptionLabel() {
        contentView.addSubview(postCaption)
        postCaption.translatesAutoresizingMaskIntoConstraints = false
        
        postCaption.text = "sksksksk"
        
        let constraints = [
            postCaption.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            postCaption.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            postCaption.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        
        for c in constraints {
            c.isActive = true
        }
    }
}
