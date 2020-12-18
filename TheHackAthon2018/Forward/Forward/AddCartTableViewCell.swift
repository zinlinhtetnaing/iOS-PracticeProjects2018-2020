//
//  AddCartTableViewCell.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/9/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class AddCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var total: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(code:String,name:String,price:String,qty:String,total:String){
        self.code.text = code
        self.name.text = name
        self.price.text = price
        self.qty.text = qty
        self.total.text = total
    }

}
