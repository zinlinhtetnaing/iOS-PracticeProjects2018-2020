//
//  CheckBox.swift
//  CheckBoxMar52019
//
//  Created by Zin Lin Htet Naing on 3/5/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    //Mark: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCheckBox()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCheckBox()
    }
    
    //Mark: PrivateMethods
    private func setupCheckBox() {
        setImage(UIImage(named: "uncheck"), for: .normal)
        setImage(UIImage(named: "check"), for: .selected)
        addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
    }
    
    //Mark: ButtonAction
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
