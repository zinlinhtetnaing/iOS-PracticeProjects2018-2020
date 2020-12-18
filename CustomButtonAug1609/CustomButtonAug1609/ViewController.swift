//
//  ViewController.swift
//  CustomButtonAug1609
//
//  Created by Zin Lin Htet Naing on 8/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: CustomButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: MDCButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4039215686, green: 0.2274509804, blue: 0.7176470588, alpha: 1)
        googleMaterialButton()
//        threeDEffect()
        threeDEffectSecondWay()
        buttonOne.addTarget(self, action: #selector(buttonOneClick), for: .touchUpInside)
    }

    @objc func buttonOneClick() {
        buttonOne.shake()
    }

    func googleMaterialButton() {
        buttonFour.setElevation(ShadowElevation(rawValue: 5), for: .normal)
        buttonFour.isUppercaseTitle = false
        buttonFour.setTitle("Materials", for: .normal)
        buttonFour.setBackgroundColor(#colorLiteral(red: 0.3323073983, green: 0, blue: 0.4981182218, alpha: 1))
        buttonFour.setTitleColor(UIColor.white, for: UIControl.State.normal)
        buttonFour.setBorderColor(#colorLiteral(red: 0.3323073983, green: 0, blue: 0.4981182218, alpha: 1), for: UIControl.State.normal)
        buttonFour.setBorderWidth(0.0, for: UIControl.State.normal)
        buttonFour.layer.cornerRadius = 7
    }

    func threeDEffect() {
        buttonThree.layer.shadowColor = #colorLiteral(red: 0.3323073983, green: 0, blue: 0.4981182218, alpha: 1)
        buttonThree.backgroundColor = #colorLiteral(red: 0.3323073983, green: 0, blue: 0.4981182218, alpha: 1)
        buttonThree.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        buttonThree.layer.masksToBounds = false
        buttonThree.layer.shadowRadius = 2.0
        buttonThree.layer.shadowOpacity = 0.5
        buttonThree.layer.cornerRadius = 7
        buttonThree.layer.borderColor = #colorLiteral(red: 0.3323073983, green: 0, blue: 0.4981182218, alpha: 1)
        buttonThree.layer.borderWidth = 2.0
    }

    func threeDEffectSecondWay() {
        buttonThree.backgroundColor = #colorLiteral(red: 0.3323073983, green: 0, blue: 0.4981182218, alpha: 1)
        buttonThree.layer.cornerRadius = 7.0
        buttonThree.layer.borderWidth = 2.0
        buttonThree.layer.borderColor = UIColor.clear.cgColor
        buttonThree.layer.shadowColor = #colorLiteral(red: 0.2086090686, green: 0, blue: 0.5, alpha: 1)
        buttonThree.layer.shadowOpacity = 1.0
        buttonThree.layer.shadowRadius = 1.0
        buttonThree.layer.shadowOffset = CGSize(width: 0, height: 3)
    }

}
