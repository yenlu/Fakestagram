//
//  ViewController.swift
//  LoginScreen
//
//  Created by Yen Lu on 10/11/19.
//  Copyright © 2019 Yen Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //add logo
        addLogo()
        
        //add text fields for username and password
        addUserNameField()
        addPassWordField()
        
        //add login button
        addLoginButton()
    }
    
    func addLogo() {
        //create UIImageView
        let logoView = UIImageView()
        
        //add insta logo to UIImageView
        logoView.image = UIImage(named: "instagram-logo.png")
        
        //set aspect ratio
        logoView.contentMode = .scaleAspectFit
        
        //add imageView as subview
        view.addSubview(logoView)
        
        //set translatesAutoresizingMaskIntoConstraints to false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        //add constraints
        let topConstraint = logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        let xConstraint = logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstrant = logoView.widthAnchor.constraint(equalToConstant: 250)
        
        //activate constraints
        topConstraint.isActive = true
        xConstraint.isActive = true
        widthConstrant.isActive = true
    }
    
    func addUserNameField() {
        //create a text field
        let userNameField = UITextField()
        
        //set properties
        userNameField.placeholder = "Username"
        userNameField.delegate = self
        userNameField.textAlignment = .center
        
        view.addSubview(userNameField)
        
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        
        let yConstraint = userNameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        let leftConstraint = userNameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = userNameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
                
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    func addPassWordField() {
        //create a text field
        let passWordField = UITextField()
        
        //set properties
        passWordField.placeholder = "Password"
        passWordField.delegate = self
        passWordField.textAlignment = .center
        
        view.addSubview(passWordField)
        
        passWordField.translatesAutoresizingMaskIntoConstraints = false
        
        let yConstraint = passWordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        let leftConstraint = passWordField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = passWordField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
                
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    func addLoginButton() {
        let loginButton = UIButton(type: .system)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let bottomConstraint = loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        
        xConstraint.isActive = true
        bottomConstraint.isActive = true
    }
    
//    func addLabel() {
//        //create label
//        var label = UILabel()
//
//        //set text
//        label.text = "Hi"
//
//        //add label as subview
//        view.addSubview(label)
//
//        //set translatesAutoresizingMaskIntoConstraints to false
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        //create constraints
//        let xConstraint = label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let yConstraint = label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//        //activate the constraints
//        xConstraint.isActive = true
//        yConstraint.isActive = true
//    }
}

//same as putting a new function in the class, but cleaner
//everything in here is delegated to the text field
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("user started typing")
    }
}
