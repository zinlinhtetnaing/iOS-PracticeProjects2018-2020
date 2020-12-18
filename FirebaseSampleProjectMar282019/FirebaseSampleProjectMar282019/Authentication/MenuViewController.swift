//
//  MenuViewController.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 3/28/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    @IBOutlet weak var loginButton: RoundedWhiteButton!
    
    @IBOutlet weak var signupButton: RoundedWhiteButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add the background gradient
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if let user = Auth.auth().currentUser {
//            self.performSegue(withIdentifier: "toHomeSegue", sender: self)
//        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    @IBAction func loginButtonAction(_ sender: RoundedWhiteButton) {
        performSegue(withIdentifier: "toLoginSegue", sender: self)
    }
    
    @IBAction func signupButtonAction(_ sender: RoundedWhiteButton) {
        performSegue(withIdentifier: "toSignupSegue", sender: self)
    }
    
}
