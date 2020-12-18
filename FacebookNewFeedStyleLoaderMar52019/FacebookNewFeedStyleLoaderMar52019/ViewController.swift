//
//  ViewController.swift
//  FacebookNewFeedStyleLoaderMar52019
//
//  Created by Zin Lin Htet Naing on 3/5/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import ListPlaceholder

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var yourEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    @IBOutlet weak var loaderView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        showLoader()
    }
    
    func setup() {
        textFieldAppearance(textField: fullNameTextField)
        textFieldAppearance(textField: yourEmailTextField)
        textFieldAppearance(textField: passwordTextField)
        buttonAppearance(button: facebookButton)
        buttonAppearance(button: googleButton)
        buttonAppearance(button: createAccountButton)
    }
    
    func showLoader() {
        loaderView.showLoader()
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(removeLoader), userInfo: nil, repeats: false)
    }
    
    @objc func removeLoader() {
        loaderView.hideLoader()
    }
    
    func textFieldAppearance(textField: UITextField) {
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = UIColor(red: 117/255, green: 124/255, blue: 135/255, alpha: 0.5).cgColor
    }
    
    func buttonAppearance(button: UIButton) {
        button.titleLabel?.font = UIFont(name: "DIN Alternate", size: 17)
    }
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        print("Create Account")
    }
    
    @IBAction func fbSignUpButtonAction(_ sender: UIButton) {
        print("SignUp Facebook")
    }
    
    @IBAction func googleSignUpButton(_ sender: UIButton) {
        print("SignUp Google")
    }
    
    
    
}

