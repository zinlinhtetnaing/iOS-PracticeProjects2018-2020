//
//  TableViewCell.swift
//  RelmDatabaseAug309
//
//  Created by Zin Lin Htet Naing on 8/3/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with pickUpLine: PickUpLine) {
        lineLabel.text = pickUpLine.line
        scoreLabel.text = pickUpLine.scoreString()
        emailLabel.text = pickUpLine.email
    }
    
}
