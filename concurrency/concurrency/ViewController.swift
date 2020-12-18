//
//  ViewController.swift
//  concurrency
//
//  Created by Zin Lin Htet Naing on 6/30/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var infoLabel: UILabel!          // Label - noun
    @IBOutlet weak var counterLabel: UILabel!       // action - verb
    var countValue = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func startCount(_ sender: UIButton) {
        
        // Opeation Query
        // sample Query
        //        let Q = OperationQueue()
        //        Q.addOperation {
        //            <#code#>
        //        }
        //
        //        // Hight Priority Thread / Main Thread
        //        // Ui Related Thread
        //
        //        let mainQuery = OperationQueue.main
        //        mainQuery.addOperation {
        //            <#code#>
        //        }
        
        OperationQueue.main.addOperation {
            self.infoLabel.text = "Counting..."
        }
        
        // counting
        // while / for CPU intensive => run in other thread / not sure
        
        let Q = OperationQueue()
        
        countValue = 0
        
        Q.addOperation {
            
            for i in 0...1000 {
                
                
                OperationQueue.main.addOperation {   // 100% to be sure , move to MT
                    
                    self.counterLabel.text = String(i)
                    
                    
                    OperationQueue.main.addOperation {
                        self.infoLabel.text = "Finish..."
                    }
                    
                }
                
                
            }
            
            
            
        }
        
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

