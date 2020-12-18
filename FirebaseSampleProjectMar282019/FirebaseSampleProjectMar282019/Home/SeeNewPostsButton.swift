//
//  SeeNewPostsButton.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 4/3/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class SeeNewPostsButton:UIView {
    
    var button:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        button = UIButton()
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        
        button.setTitle("See New Posts", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        button.backgroundColor = #colorLiteral(red: 0.2174585164, green: 0.8184141517, blue: 0, alpha: 1)
//            UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        
        button.sizeToFit()
        
        button.layer.cornerRadius = 16.0
        
        addShadow()
    }
    
    func addShadow() {
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
    }
    
    
    
}
