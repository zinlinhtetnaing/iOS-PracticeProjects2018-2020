//
//  ViewController.swift
//  SwiftyPrint(Log)DemoJun2519
//
//  Created by Zin Lin Htet Naing on 6/25/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUP()
        
        print("This is simple print statement")
        
        log.success("\(Log.stats()) Successfully Lunch App ")/
        
        DispatchQueueHelper.delay(bySeconds: 1) {
            log.warning("\(Log.stats()) Strike 1! ")/
        }
        
        DispatchQueueHelper.delay(bySeconds: 2) {
            log.warning("\(Log.stats()) Strike 2! ")/
        }
        
        DispatchQueueHelper.delay(bySeconds: 3) {
            log.error("\(Log.stats()) Strike 3! Your Out ")/
        }
    }
    
    func setUP() {
        DispatchQueueHelper.delay(bySeconds: 4, dispatchLevel: .background) {
            log.todo("\(Log.stats()) fix the delay issue next week")/
        }
    }
}

