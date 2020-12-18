//
//  RoundedWhitebutton.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 4/1/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class RoundedWhiteButton: UIButton {

    
    var highlightedColor = UIColor.orange {
        didSet {
            if isHighlighted {
                backgroundColor = highlightedColor
            }
        }
    }
    
    var defaultColor = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1) {
        didSet {
            if !isHighlighted {
                backgroundColor = defaultColor
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                if currentTitle == "Login" {
                    backgroundColor = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1)
                }
                if currentTitle == "SignUp" {
                    backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                }
//                backgroundColor = highlightedColor
            }
            else {
//                backgroundColor = defaultColor
                
                if currentTitle == "Login" {
                    backgroundColor = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1)
                }
                if currentTitle == "SignUp" {
                    backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup() {
//        self.layer.borderColor = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1)
//        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}
