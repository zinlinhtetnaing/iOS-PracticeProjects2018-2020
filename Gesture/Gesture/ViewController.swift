//
//  ViewController.swift
//  Gesture
//
//  Created by Zin Lin Htet Naing on 6/10/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    @IBOutlet weak var infolabel: UILabel!
    @IBOutlet weak var counterlabel: UILabel!
    
    @IBAction func tapTheView(_ sender: UITapGestureRecognizer) {
        infolabel.text = "Tapping..."
        let pt = sender.location(in:self.view)
        print(pt.x,pt.y)
        updateCounter()
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(doIt))
        
        view.addGestureRecognizer(tapgesture)
        
        
    }
    @objc
    func doIt(_ sender: UITapGestureRecognizer){
        print("dot dot")
    }
    
    @IBAction func increase5(_ sender: UISwipeGestureRecognizer) {
        counter += 5
        updateCounter()
    }
    @IBAction func decrease5(_ sender: UISwipeGestureRecognizer) {
        if counter - 5 >= 0{
            counter -= 5
            updateCounter()
        }
    }
    @IBAction func decrease(_ sender: UISwipeGestureRecognizer) {
        if counter - 1 >= 0{
            counter -= 1
            updateCounter()
        }
    
    }
    var initDeg = 0.0
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        
        if sender.state == .began
        {
            initDeg = 0
        }
       
        let deg = Double(sender.rotation) * (180 / Double.pi)
        print(deg)
        
        let diff = deg - initDeg
        if diff > 10 {
            initDeg = deg
            counter += 10
        }
        updateCounter()
    }
    
    
    
    @IBAction func reset(_ sender: UILongPressGestureRecognizer) {
        counter = 0
        updateCounter()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateCounter(){
        
        counterlabel.text = String(counter)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

