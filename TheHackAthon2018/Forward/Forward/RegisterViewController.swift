//
//  RegisterViewController.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/8/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameErrorLabel: UILabel!
    @IBOutlet weak var lastNameErrorLabel: UILabel!
    @IBOutlet weak var userNameErrorLabel: UILabel!
    @IBOutlet weak var emailNameErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var comfirmPasswordErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitleSetup()
        
//     hideErrorLabel()
    }
    
    func pageTitleSetup() {
        self.title = "Register"
    }
    
    func hideErrorLabel(){
        firstNameErrorLabel.isHidden = true
        lastNameErrorLabel.isHidden = true
        userNameErrorLabel.isHidden = true
        emailNameErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        comfirmPasswordErrorLabel.isHidden = true
    }

    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
