//
//  WelcomeViewController.swift
//  BiometricLogin
//
//  Created by Zin Lin Htet Naing on 2/12/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    let userDefault = UserDefaults.standard
    
    let autoLoginKey = "autoLoginKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        userDefault.set(false, forKey: autoLoginKey)
        userDefault.synchronize()
        self.navigationController?.popViewController(animated: true)
    }
}
