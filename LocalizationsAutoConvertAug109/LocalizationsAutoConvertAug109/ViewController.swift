//
//  ViewController.swift
//  LocalizationsAutoConvertAug109
//
//  Created by Zin Lin Htet Naing on 8/1/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentLanguageLabel: UILabel!
    
    let animals = [LocalizationSystem.sharedInstance.localizedStringForKey(key: "lion", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "tiger", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "rabbit", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "zebra", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "horse", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "cat", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "pig", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "goat", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "monkey", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "dog", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "peacock", comment: ""),
                   LocalizationSystem.sharedInstance.localizedStringForKey(key: "bear", comment: "")
                  ]

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "title", comment: "")
        currentLanguageLabel.text = LocalizationSystem.sharedInstance.getLanguage()

        if LocalizationSystem.sharedInstance.getLanguage() == "my" {
            let mmFont = UIFont.Myanmar3.setMMFont(withSize: 15)
            UILabel.appearance().font = mmFont
        }else {
            let engFont = UIFont.RobotoMedium.setEngFont(withSize: 15)
            UILabel.appearance().font = engFont
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        //print("Device Language ---->",devicLaguageCheck())
        //printFonts()
    }

    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }

    func devicLaguageCheck() -> String {
        guard let currentLanguage = Locale.current.languageCode else {
            return ""
        }
        return currentLanguage
    }

    @IBAction func myanmarButtonClick(_ sender: UIButton) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "my")
        reload()
    }

    @IBAction func englishButtonClick(_ sender: UIButton) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        reload()
    }

    func reload() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = vc
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titleLabel?.text = animals[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
