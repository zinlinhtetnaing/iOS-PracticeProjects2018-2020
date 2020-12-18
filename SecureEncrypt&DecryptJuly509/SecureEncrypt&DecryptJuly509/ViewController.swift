//
//  ViewController.swift
//  SecureEncrypt&DecryptJuly509
//
//  Created by Zin Lin Htet Naing on 7/5/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import CommonCrypto

class ViewController: UIViewController {

    @IBOutlet weak var encryptTextTextField: UITextField!
    @IBOutlet weak var encryTextShowTextView: UITextView!

    var keepEncryptedData = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func encryptionButton(_ sender: UIButton) {
        guard let text = encryptTextTextField.text else { return }
        let encrypt = text.encryptAES256()
        keepEncryptedData = encrypt
        print(encrypt)
        encryTextShowTextView.text = encrypt
    }

    @IBAction func decryptionButton(_ sender: UIButton) {
        let decrypt = keepEncryptedData.decryptAES256()
        encryTextShowTextView.text = decrypt
    }
}


