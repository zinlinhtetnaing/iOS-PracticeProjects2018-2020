//
//  ViewController.swift
//  LottieTestingJul1809
//
//  Created by Zin Lin Htet Naing on 7/18/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
    }

    func startAnimation() {
        let animation = Animation.named("no-connection")
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.play()
    }


}

