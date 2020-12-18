//
//  ViewController.swift
//  EncryptDecryptJul409
//
//  Created by Zin Lin Htet Naing on 7/4/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit
import CommonCrypto

class ViewController: UIViewController {

    @IBOutlet weak var encryptTextField: UITextField!
    @IBOutlet weak var decryptedTextLabel: UILabel!

    var encrypted = Data()

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    @IBAction func EncryptButton(_ sender: UIButton) {

        let password = MD5(string: "04E3AE56-E280-42DD-8A14-A0FB975CD3C0")
        print(password)
        print(password.base64EncodedString())

        let iv = "ThisIsUrPassword"
        guard let byteIV = iv.data(using: String.Encoding.utf8) else { return }
        print(byteIV)
        print(byteIV.base64EncodedString())

        guard let encryptText = encryptTextField.text else { return }
        let encryptTextData = encryptText.data(using:String.Encoding.utf8)!

        let encryptedData = encryptTextData.aesEncrypt( keyData:password, ivData:byteIV, operation:kCCEncrypt)

        print(encryptedData.base64EncodedString())
        print("----")
        encrypted = encryptedData
        decryptedTextLabel.text = encryptTextData.base64EncodedString()

        

    }


    @IBAction func DecryptButton(_ sender: UIButton) {
        let password = MD5(string: "04E3AE56-E280-42DD-8A14-A0FB975CD3C0")
        print(password)
        print(password.base64EncodedString())

        let iv = "ThisIsUrPassword"
        guard let byteIV = iv.data(using: String.Encoding.utf8) else { return }
        print(byteIV)
        print(byteIV.base64EncodedString())


        let decryptedData = encrypted.aesEncrypt( keyData: password, ivData:byteIV, operation:kCCDecrypt)
        let decrypted     = String(bytes:decryptedData, encoding:String.Encoding.utf8)!
        print(decrypted)
        decryptedTextLabel.text = decrypted


    }

    func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
}

extension Data {

    func aesEncrypt( keyData: Data, ivData: Data, operation: Int) -> Data {
        let dataLength = self.count
        let cryptLength  = size_t(dataLength + kCCBlockSizeAES128)
        var cryptData = Data(count:cryptLength)

        let keyLength = size_t(kCCKeySizeAES128)
        let options = CCOptions(kCCOptionPKCS7Padding)


        var numBytesEncrypted :size_t = 0

        let cryptStatus = cryptData.withUnsafeMutableBytes {cryptBytes in
            self.withUnsafeBytes {dataBytes in
                ivData.withUnsafeBytes {ivBytes in
                    keyData.withUnsafeBytes {keyBytes in
                        CCCrypt(CCOperation(operation),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes, keyLength,
                                ivBytes,
                                dataBytes, dataLength,
                                cryptBytes, cryptLength,
                                &numBytesEncrypted)
                    }
                }
            }
        }

        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)

        } else {
            print("Error: \(cryptStatus)")
        }

        return cryptData;
    }

}

