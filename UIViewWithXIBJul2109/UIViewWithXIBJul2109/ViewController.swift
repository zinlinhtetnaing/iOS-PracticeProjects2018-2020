//
//  ViewController.swift
//  UIViewWithXIBJul2109
//
//  Created by Zin Lin Htet Naing on 7/21/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var featureView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(featureView)

        if let featureView2 = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView {
            featureView2.titleLabel.text = "New Feature"
            featureView2.purchaseButton.addTarget(self, action: #selector(ViewController.purchaseFeature(_:)), for: .touchUpInside)
            view.addSubview(featureView2)
        }

        if let featureView3 = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView {
            featureView3.frame.origin.y = 200
            featureView3.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            featureView3.titleLabel.text = "Another Feature"
            featureView3.purchaseButton.addTarget(self, action: #selector(ViewController.anotherFeature(_:)), for: .touchUpInside)
            view.addSubview(featureView3)
        }

        if let featureView4 = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView {
            featureView4.frame.origin.y = 400
            featureView4.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            featureView4.titleLabel.text = "Another Feature 3"
            featureView4.purchaseButton.addTarget(self, action: #selector(ViewController.anotherFeature3(_:)), for: .touchUpInside)
            view.addSubview(featureView4)
        }

        if let featureView5 = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView {
            featureView5.frame.origin.y = 600
            featureView5.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            featureView5.titleLabel.text = "Another Feature 5"
            featureView5.purchaseButton.addTarget(self, action: #selector(ViewController.anotherFeature3(_:)), for: .touchUpInside)
            view.addSubview(featureView5)
        }

    }

    @objc func purchaseFeature(_ sender: UIButton) {
        print("U get New Feature")
    }

    @objc func anotherFeature(_ sender: UIButton) {
        print("U get Another Feature")
    }

    @objc func anotherFeature3(_ sender: UIButton) {
        print("U get Another Feature 3")
    }


}

