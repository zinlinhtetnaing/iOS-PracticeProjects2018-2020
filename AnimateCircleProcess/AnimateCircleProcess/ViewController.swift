//
//  ViewController.swift
//  AnimateCircleProcess
//
//  Created by Zin Lin Htet Naing on 10/30/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class ViewController: UIViewController {

    @IBOutlet weak var circularProgressBar: MBCircularProgressBarView!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularProgressBar.value = 0
        progressBar.value = 0
        circularProgressBar.fontColor = UIColor.green
        clickButton.setTitle("Click", for: .normal)
    }
    
    
    @IBAction func buttonaction(_ sender: UIButton) {
        UIView.animate(withDuration:5.0) {
            if self.clickButton.titleLabel?.text == "Click"{
                self.circularProgressBar.value  = 100
                self.progressBar.value = 100
                self.clickButton.setTitle("Reset", for: .normal)
                self.circularProgressBar.fontColor = UIColor.red
                self.circularProgressBar.emptyLineStrokeColor = UIColor.orange
            }
            else if self.clickButton.titleLabel?.text == "Reset"{
                self.circularProgressBar.value = 0
                self.progressBar.value = 0
                self.circularProgressBar.fontColor = UIColor.green
                self.clickButton.setTitle("Click", for: .normal)
            }
            
        }
       
        
    }
    

}

