//
//  ViewController.swift
//  BiometricLogin
//
//  Created by Zin Lin Htet Naing on 2/12/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var faceIDButton: UIButton!
    
    let userName = "a"
    let password = "123"
    let empty = ""
    let userDefault = UserDefaults.standard
    let autoLoginKey = "autoLoginKey"
    let context = LAContext()
    
    var error: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonImage(faceIDButton)
    
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        login()
    }
    
    @IBAction func faceIDButton(_ sender: Any) {
        autoLogin()
    }
    
    func setButtonImage(_ button:UIButton) {
        let image = UIImage(named:"faceID")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.orange
        button.tintColor = UIColor.white
    }
    
    func login() {
        if userNameTextField.text == userName && passwordTextField.text == password {
            emptyTextField()
            saveUserDefault()
            pushViewController()
        }
        else {
            alertBox(title: "Warning!", message: ("username and password is \n incorrect please try again"), btnTitle: "OK")
        }
    }
    
    func emptyTextField() {
        userNameTextField.text = empty
        passwordTextField.text = empty
    }
    
    func saveUserDefault() {
        userDefault.set(true, forKey: autoLoginKey)
        userDefault.synchronize()
    }
    
    func autoLogin() {
        if userDefault.bool(forKey: autoLoginKey) == true {
            authenticateUser()
        }
        else {
            alertBox(title: "Warning", message: "Please One time Manual Login ", btnTitle: "OK")
        }
    }
    
    func pushViewController() {
        let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func alertBox(title:String, message:String, btnTitle:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func authenticateUser() {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                DispatchQueue.main.async {
                    if success {
                        self.pushViewController()
                    }
                    else {
                        self.alertBox(title: "Authentication Failed", message: "Sorry!", btnTitle: "OK")
                    }
                }
            }
        }
        else {
            self.alertBox(title: "Touch ID or Face ID not available", message: "Your device is not configured for Touch ID or Face ID.", btnTitle: "OK")
        }
        
    }
    
}

