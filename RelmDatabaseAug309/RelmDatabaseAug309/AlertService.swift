//
//  AlertService.swift
//  RelmDatabaseAug309
//
//  Created by Zin Lin Htet Naing on 8/4/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class AlertService {


    private init() {}

    static func addAlert(in vc: UIViewController, completion: @escaping(String, Int?, String?) -> Void) {

        let alert = UIAlertController(title: "Add Line", message: nil, preferredStyle: .alert)

        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = #colorLiteral(red: 0.4039215686, green: 0.2274509804, blue: 0.7176470588, alpha: 1)
        alert.view.tintColor = UIColor.white

        alert.addTextField { (lineTF) in
            lineTF.placeholder = "Enter Pick Up Line"
            lineTF.borderStyle = .roundedRect
        }
        alert.addTextField { (scoreTF) in
            scoreTF.placeholder = "Enter Score"
            scoreTF.borderStyle = .roundedRect
        }
        alert.addTextField { (emailTF) in
            emailTF.placeholder = "Enter Email"
            emailTF.borderStyle = .roundedRect
        }

        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?.last?.text
                else { return }

            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString

            completion(line, score, email)
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }

    static func updateAlert(in vc: UIViewController, pickUpLine: PickUpLine, completion: @escaping(String, Int?, String?) -> Void) {

        let alert = UIAlertController(title: "Update Line", message: nil, preferredStyle: .alert)
        alert.addTextField { (lineTF) in
            lineTF.placeholder = "Enter Pick Up Line"
            lineTF.text = pickUpLine.line
            lineTF.borderStyle = .roundedRect
        }
        alert.addTextField { (scoreTF) in
            scoreTF.placeholder = "Enter Score"
            scoreTF.text = pickUpLine.scoreString()
            scoreTF.borderStyle = .roundedRect
        }
        alert.addTextField { (emailTF) in
            emailTF.placeholder = "Enter Email"
            emailTF.text = pickUpLine.email
            emailTF.borderStyle = .roundedRect
        }

        let action = UIAlertAction(title: "Update", style: .default) { (action) in
            guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?.last?.text
                else { return }

            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString

            completion(line, score, email)
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }


}
