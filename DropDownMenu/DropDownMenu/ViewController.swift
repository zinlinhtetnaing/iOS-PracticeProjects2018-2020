//
//  ViewController.swift
//  DropDownMenu
//
//  Created by Zin Lin Htet Naing on 7/2/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SelectProductButton: UIButton!
    @IBOutlet var ProductsButton: [UIButton]!
    @IBOutlet weak var showproductslabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var image = ["iphone5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectProductButton.layer.cornerRadius = SelectProductButton.frame.height / 2
        ProductsButton.forEach { (ProductsButton) in
            ProductsButton.layer.cornerRadius = ProductsButton.frame.height / 2
            ProductsButton.isHidden = true
        }
       
    }
    
    @IBAction func SelectProductButtonAction(_ sender: UIButton) {
        ProductsButton.forEach { (appleproductsbutton) in
            UIView.animate(withDuration: 0, animations: {
                appleproductsbutton.isHidden = !appleproductsbutton.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    @IBAction func ProudctsButtonAction(_ sender: UIButton) {
        if let buttonlabel = sender.titleLabel?.text{
             showproductslabel.text = buttonlabel
                
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

