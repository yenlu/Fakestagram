//
//  Username.swift
//  LoginScreen
//
//  Created by Yen Lu on 10/18/19.
//  Copyright © 2019 Yen Lu. All rights reserved.
//

import Foundation
//swift library that contains all UI elements
import UIKit

class UsernameViewController: UIViewController {
    
    var username: String?
    let usernameLabel: UILabel = UILabel()
    let forwardButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    
    //gives us the username screent
    init(username: String) { //creates new entity
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        addUsernameLabel()
        addForwardButton()
        addBackButton()
    }
    
    func addUsernameLabel() {
        
        if let username = self.username {
            usernameLabel.text = username
        }
        
        view.addSubview(usernameLabel)
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yConstraint = usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        xConstraint.isActive = true
        yConstraint.isActive = true
    }
    
    func addForwardButton() {
        forwardButton.setTitle("Forward", for: .normal)
        forwardButton.setTitleColor(.white, for: .normal)
        forwardButton.backgroundColor = .red
        backButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)

                        
        view.addSubview(forwardButton)
                
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
                
        let xConstraint = forwardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yConstraint = forwardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70)
        let leftConstraint = forwardButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        let rightConstraint = forwardButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
        
        xConstraint.isActive = true
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    func addBackButton() {
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .red
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
                        
        view.addSubview(backButton)
                
        backButton.translatesAutoresizingMaskIntoConstraints = false
                
        let xConstraint = backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yConstraint = backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110)
        let leftConstraint = backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        let rightConstraint = backButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
        
        xConstraint.isActive = true
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    @objc
    func goForward {
        print("forward button pressed")


    }
    
    @objc
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
