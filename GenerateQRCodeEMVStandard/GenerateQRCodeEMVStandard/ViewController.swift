//
//  ViewController.swift
//  GenerateQRCodeEMVStandard
//
//  Created by Zin Lin Htet Naing on 10/3/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import CoreImage
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var QRimageView: UIImageView!
    @IBOutlet weak var tostMessage: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveBtn.isEnabled = false
    }

    @IBAction func generateButton(_ sender: UIButton) {
        guard let bankLogo = UIImage(named: "logo.png") else { return }
        guard let qrURLImage = emailTF.text?.qrImage(using: UIColor.black, logo: bankLogo) else { return }
        DispatchQueue.main.async {
            self.QRimageView.image = UIImage(ciImage: qrURLImage, scale: 2.0, orientation: .up)
            self.saveBtn.isEnabled = true
        }
    }

    @IBAction func saveButton(_ sender: UIButton) {
        saveImage()
    }

    func saveImage() {
//        UIGraphicsBeginImageContext(QRimageView.frame.size)
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(QRimageView.frame.size, false, scale)
        guard let contex = UIGraphicsGetCurrentContext() else { return }
        QRimageView.layer.render(in: contex)
        guard let output = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(output, nil, nil, nil)
    }

    func screenShot() {
        guard let layer = UIApplication.shared.keyWindow?.layer else { return }
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        guard let contex = UIGraphicsGetCurrentContext() else { return }
        layer.render(in: contex)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsGetCurrentContext()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }


    @IBAction func cancelButton(_ sender: UIButton) {

    }
}
