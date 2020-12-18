//
//  InitialViewController.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 3/28/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //- Todo: Check if user is authenticated. If so, segue to the HomeViewController,otherwise, segue to the MenuViewController
        
        self.performSegue(withIdentifier: "toMenuScreenSegue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
}
