//
//  FirstViewController.swift
//  PassDataBetweenVCUsingDelegateJun1619
//
//  Created by Zin Lin Htet Naing on 6/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var passDataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func sendDataButtonAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        guard let data = passDataTextField.text else { return }
        vc.data = data
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension FirstViewController: PassDataToVC {
    func passData(data: String) {
        passDataTextField.text = data
    }
}
