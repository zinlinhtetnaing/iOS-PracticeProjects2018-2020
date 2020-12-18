//
//  SecondViewController.swift
//  PassDataBetweenVCUsingDelegateJun1619
//
//  Created by Zin Lin Htet Naing on 6/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

protocol PassDataToVC {
    func passData(data: String)
}

class SecondViewController: UIViewController {

    var data = ""
    var delegate: PassDataToVC!
    
    @IBOutlet weak var passNewDataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passNewDataTextField.text = data
    }
    
    @IBAction func backPassDataButtonAction(_ sender: UIButton) {
        guard let data = passNewDataTextField.text else { return }
        delegate.passData(data: data)
        navigationController?.popViewController(animated: true)
    }
    
}
