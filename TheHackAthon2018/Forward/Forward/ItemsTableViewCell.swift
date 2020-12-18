//
//  ItemCollectionCollectionViewCell.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/9/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemCodeLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ image:UIImage?,code:String,name:String,type:String,price:String,details:String){
        self.itemImageView.image = image
        self.itemNameLabel.text = name
        self.itemTypeLabel.text = type
        self.itemPriceLabel.text = price
        self.itemDetailsLabel.text = details
        self.itemCodeLabel.text = code
    }

}
