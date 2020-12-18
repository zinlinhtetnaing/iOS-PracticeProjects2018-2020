//
//  ViewController.swift
//  DigitalClock
//
//  Created by LIN2 on 6/4/19.
//  Copyright © 2019 LIN2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var clockColorSeg: UISegmentedControl!
    @IBOutlet weak var backgroundColorSeg: UISegmentedControl!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateTimer()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        settingsView.isHidden = true
        settingsButton.alpha = 0.25
        
        settingsView.layer.cornerRadius = 5
        settingsButton.layer.cornerRadius = 5
    }
    
    @objc func updateTimer() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        label.text = timeFormatter.string(from: Date())
    }

    @IBAction func settings(_ sender: Any) {
        if settingsView.isHidden == true {
            
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: UIControl.State.normal)
            settingsButton.alpha = 1.0
        } else {
            
            settingsView.isHidden = true
            settingsButton.setTitle("Show Settings", for: UIControl.State.normal)
            settingsButton.alpha = 0.25
        }
    }
    
    @IBAction func clockColor(_ sender: Any) {
        
        if (clockColorSeg.selectedSegmentIndex == 0){
            label.textColor = UIColor.white
        }
        if (clockColorSeg.selectedSegmentIndex == 1){
            label.textColor = UIColor.black
        }
        if (clockColorSeg.selectedSegmentIndex == 2){
            label.textColor = UIColor.red
        }
        if (clockColorSeg.selectedSegmentIndex == 3){
            label.textColor = UIColor.green
        }
        
    }
    @IBAction func backgroundColor(_ sender: Any) {
        
        if (backgroundColorSeg.selectedSegmentIndex == 0){
            self.view.backgroundColor = UIColor.black
        }
        if (backgroundColorSeg.selectedSegmentIndex == 1){
            self.view.backgroundColor = UIColor.white
        }
        if (backgroundColorSeg.selectedSegmentIndex == 2){
            self.view.backgroundColor = UIColor.yellow
        }
        if (backgroundColorSeg.selectedSegmentIndex == 3){
            self.view.backgroundColor = UIColor.blue 
        }
        
    }
}

