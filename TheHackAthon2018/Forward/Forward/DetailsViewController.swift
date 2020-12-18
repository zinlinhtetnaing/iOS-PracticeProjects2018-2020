//
//  DetailsViewController.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/9/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailCode: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    var itemDetails:(String,String,String,String,String,String)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addcartButton()
        self.title = itemDetails.1
        detailCode.text = itemDetails!.0
        detailName.text = itemDetails!.1
        detailImageView.image = UIImage(named: (itemDetails?.2)!)
        detailType.text = itemDetails!.3
        detailPrice.text = itemDetails!.4
        detailTextView.text = itemDetails!.5
    }
    
    func addcartButton(){
        let cart = UIBarButtonItem(title: "Cart", style: .plain, target: self, action: #selector(cartButtonAction(_:)))
        navigationItem.rightBarButtonItem = cart
        cart.tintColor = UIColor.black
    }
    
    @objc func cartButtonAction(_ sender:UIBarButtonItem){
        performSegue(withIdentifier: "cartdetails", sender: true)
    }
    
    @IBAction func addCardAction(_ sender: Any) {
        
    }
    

}
