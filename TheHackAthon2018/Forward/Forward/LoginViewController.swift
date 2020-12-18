//
//  LoginViewController.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/8/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitleSetup()
    }

    func pageTitleSetup() {
        self.title = "Login"
    }
    
    func loginButtonClick(){
        performSegue(withIdentifier: "dashboard", sender: true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        loginButtonClick()
    }
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        alertBox(title: "Warning", message: "This Featur is not Avalible")
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: true)
    }
    
    
    
    
    
    
    
    

    

}

