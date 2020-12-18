//
//  ViewController.swift
//  QRCodeGeneratorF121019
//
//  Created by Zin Lin Htet Naing on 2/12/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var codeSelectorSegment: UISegmentedControl!
    
    @IBOutlet weak var dataTextFieldOne: UITextField!
    @IBOutlet weak var dataTextFieldTwo: UITextField!
    @IBOutlet weak var dataTextFieldThree: UITextField!
    
    @IBOutlet weak var generateButton: UIButton!
    
    @IBOutlet weak var displayCodeImageView: UIImageView!
    
    var filter:CIFilter!
    
    var collectData = [String]()
    
    let empty = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUI()
        generateButton.layer.cornerRadius = 5
    }
    
    func textFieldUI() {
        uiAppearance(textField: dataTextFieldOne)
        uiAppearance(textField: dataTextFieldTwo)
        uiAppearance(textField: dataTextFieldThree)
    }
    
    func uiAppearance(textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
    }

    @IBAction func generateButton(_ sender: UIButton) {
        generator()
        if let image = generateQRCode(from: dataTextFieldOne.text!) {
            displayCodeImageView.image = image
        }
        else {
            print("ERROR")
        }
        
//        getTextFieldData()

    }
    
//    func getTextFieldData() {
//        if dataTextFieldOne.text != empty {
//            let dataOne = dataTextFieldOne.text!
//            collectData.append(dataOne)
//        }
//        if dataTextFieldTwo.text != empty {
//            let dataTwo = dataTextFieldTwo.text!
//            collectData.append(dataTwo)
//        }
//        if dataTextFieldThree.text != empty {
//            let dataThree = dataTextFieldThree.text!
//            collectData.append(dataThree)
//        }
//        for data in collectData {
//            let generateData = data.data(using: String.Encoding.ascii)
//            if let filter = CIFilter(name: "CIQRCodeGenerator") {
//                filter.setValue(generateData, forKey: "inputMessage")
//                let transform = CGAffineTransform(scaleX: 3, y: 3)
//
//                if let output = filter.outputImage?.transformed(by: transform) {
//                    displayCodeImageView.image = UIImage(ciImage: output)
//                }
//            }
//        }
//    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func generator() {
        if let text = dataTextFieldOne.text {
            let data = text.data(using: String.Encoding.ascii, allowLossyConversion: false)
            if codeSelectorSegment.selectedSegmentIndex == 0 {
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            }
            else {
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
            saveAndShowData(data: data!)
        }
    }

    func saveAndShowData(data:Data) {
        filter.setValue(data, forKey: "InputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
        displayCodeImageView.image = image
        displayCodeImageView.contentMode = .scaleAspectFit
    }

}

