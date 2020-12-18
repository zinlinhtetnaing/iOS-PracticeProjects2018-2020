//
//  ViewController.swift
//  CheckBoxMar52019
//
//  Created by Zin Lin Htet Naing on 3/5/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var checkBox1: UIButton!
    @IBOutlet weak var checkBox2: UIButton!
    @IBOutlet weak var checkBox3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllCheckBox()
    }
    
    private func setupAllCheckBox() {
        setupCheckBox()
        setupCheckBox1()
        setupCheckBox2()
        setupCheckBox3()
    }
    
    private func setupCheckBox() {
        checkBox.setImage(UIImage(named: "uncheck"), for: .normal)
        checkBox.setImage(UIImage(named: "check"), for: .selected)
        checkBox.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
    }
    
    private func setupCheckBox1() {
        checkBox1.setImage(UIImage(named: "uncheck1"), for: .normal)
        checkBox1.setImage(UIImage(named: "check1"), for: .selected)
        checkBox1.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
    }
    
    private func setupCheckBox2() {
        checkBox2.setImage(UIImage(named: "uncheck2"), for: .normal)
        checkBox2.setImage(UIImage(named: "check2"), for: .selected)
        checkBox2.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
    }
    
    private func setupCheckBox3() {
        checkBox3.setImage(UIImage(named: "uncheck3"), for: .normal)
        checkBox3.setImage(UIImage(named: "check3"), for: .selected)
        checkBox3.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
    }
    
    @objc func checkboxTapped(_ button: UIButton) {
        if button.isSelected == true {
            button.isSelected = false
        }
        else {
            button.isSelected = true
        }
        print("Checkbox Pressed")
    }

}

