//
//  ViewController.swift
//  RandomPasswordGenerator
//
//  Created by Zin Lin Htet Naing on 7/23/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import GameKit
class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func PasswordGeneratorAction(_ sender: UIButton) {
        passwordTextfield.text = "\(passwordGenerator())"
        
    }
    
    func passwordGenerator() -> String {
        let sourcesString = "0123456789ABCDEFGHIJKLNMOPQRSTUVWXYZabcdefghijklnmopqrstuvwxyz"
        var sequenceofCharacters:[Character] = []
        for item in sourcesString.characters{
            sequenceofCharacters.append(item)
        }
        var index = 1
        let passwordLength = 11
        var mypassword:[Character] = []
        let password:String
        var randomPositionPicker:Int
        
        while index <= passwordLength {
            randomPositionPicker = GKRandomSource.sharedRandom().nextInt(upperBound:sequenceofCharacters.count)
            mypassword.append(sequenceofCharacters[randomPositionPicker])
            index += 1
        }
        password = String(mypassword)
        return password
    }
}




