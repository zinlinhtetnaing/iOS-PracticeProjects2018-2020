//
//  Controller.swift
//  EncryptDecryptJul409
//
//  Created by Zin Lin Htet Naing on 7/5/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

//import Foundation
//
//
//import Foundation
//import UIKit
//import CommonCrypto
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var encryptTextField: UITextField!
//    @IBOutlet weak var encryptKey: UITextField!
//    @IBOutlet weak var decryptTextField: UITextField!
//    @IBOutlet weak var resultTextField: UITextField!
//
//    @IBOutlet weak var encryptedLabel: UILabel!
//    @IBOutlet weak var decryptedLabel: UILabel!
//    @IBOutlet weak var passwordLabel: UILabel!
//    @IBOutlet weak var keyLabel: UILabel!
//    @IBOutlet weak var ivLabel: UILabel!
//    @IBOutlet weak var saltLabel: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //        do {
//        //            let sourceData = "AES256".data(using: .utf8)!
//        //            let password = "password"
//        //            let salt = AES256Crypter.randomSalt()
//        //            let iv = AES256Crypter.randomIv()
//        //            let key = try AES256Crypter.createKey(password: password.data(using: .utf8)!, salt: salt)
//        //            let aes = try AES256Crypter(key: key, iv: iv)
//        //            let encryptedData = try aes.encrypt(sourceData)
//        //            let decryptedData = try aes.decrypt(encryptedData)
//        //
//        //            print("Encrypted hex string: \(encryptedData.hexString)")
//        //            print("Decrypted hex string: \(decryptedData.hexString)")
//        //            print(encryptedData.base64EncodedString())
//        //            print(decryptedData.base64EncodedString())
//        //        } catch {
//        //            print("Failed")
//        //            print(error)
//        //        }
//        //
//        //
//        //
//
//        //First Way
//        //        do {
//        //            let digest = "hello world".data(using: .utf8)!
//        //            let password = "foo"
//        //            let salt = AES256.randomSalt()
//        //            let iv = AES256.randomIv()
//        //            let key = try AES256.createKey(password: password.data(using: .utf8)!, salt: salt)
//        //            let aes = try AES256(key: key, iv: iv)
//        //            let encrypted = try aes.encrypt(digest)
//        //            let decrypted = try aes.decrypt(encrypted)
//        //
//        //            print("Encrypted: \(encrypted.hexString)")
//        //            print("Decrypted: \(decrypted.hexString)")
//        //            print("Password: \(password)")
//        //            print("Key: \(key.hexString)")
//        //            print("IV: \(iv.hexString)")
//        //            print("Salt: \(salt.hexString)")
//        //            print(" ")
//        //
//        //            encryptedLabel.text = encrypted.hexString
//        //            decryptedLabel.text = decrypted.hexString
//        //            passwordLabel.text = password
//        //            keyLabel.text = key.hexString
//        //            ivLabel.text = iv.hexString
//        //            saltLabel.text = salt.hexString
//        //
//        //
//        //            print("#! /bin/sh")
//        //            print("echo \(digest.hexString) | xxd -r -p > digest.txt")
//        //            print("echo \(encrypted.hexString) | xxd -r -p > encrypted.txt")
//        //            print("openssl aes-256-cbc -K \(key.hexString) -iv \(iv.hexString) -e -in digest.txt -out encrypted-openssl.txt")
//        //            print("openssl aes-256-cbc -K \(key.hexString) -iv \(iv.hexString) -d -in encrypted.txt -out decrypted-openssl.txt")
//        //
//        //        } catch {
//        //            print("Failed")
//        //            print(error)
//        //        }
//
//
//        //        let password = MD5("password")
//        //        print(password)
//
//
//        //Password
//        //        print("04E3AE56-E280-42DD-8A14-A0FB975CD3C0".md5Value)
//
//        //        var password = "04E3AE56-E280-42DD-8A14-A0FB975CD3C0".md5Value
//        //        print(password.base64EncodedString())
//
//        //        let byte =
//
//        //        let encrypt = "Good".aesEncrypt(key: "password".md5Value, iv: "ThisIsUrPassword")
//        //        print(encrypt)
//
//        let password = MD5(string: "04E3AE56-E280-42DD-8A14-A0FB975CD3C0")
//        print(password)
//        print(password.base64EncodedString())
//
//        let iv = "ThisIsUrPassword"
//        guard let byteIV = iv.data(using: String.Encoding.utf8) else { return }
//        print(byteIV)
//        print(byteIV.base64EncodedString())
//
//
//        let message     = "secret message"
//        //        let key         = "key890123456"
//        //        let ivString     = "abcdefghijklmnop"   // 16 bytes for AES128
//
//        let messageData = message.data(using:String.Encoding.utf8)!
//        //        let keyData     = key.data(using: .utf8)!
//        //        let ivData      = ivString.data(using: .utf8)!
//
//        let encryptedData = messageData.aesEncrypt( keyData:password, ivData:byteIV, operation:kCCEncrypt)
//        print(encryptedData.base64EncodedString())
//        //        let decryptedData = encryptedData.aesEncrypt( keyData:keyData, ivData:ivData, operation:kCCDecrypt)
//        //        let decrypted     = String(bytes:decryptedData, encoding:String.Encoding.utf8)!
//        //
//        //        return message == decrypted
//
//
//
//    }
//
//    @IBAction func EncryptButton(_ sender: UIButton) {
//
//    }
//
//
//    @IBAction func DecryptButton(_ sender: UIButton) {
//
//    }
//
//    func MD5(string: String) -> Data {
//        let length = Int(CC_MD5_DIGEST_LENGTH)
//        let messageData = string.data(using:.utf8)!
//        var digestData = Data(count: length)
//
//        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
//            messageData.withUnsafeBytes { messageBytes -> UInt8 in
//                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
//                    let messageLength = CC_LONG(messageData.count)
//                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
//                }
//                return 0
//            }
//        }
//        return digestData
//    }
//
//
//
//    //
//    //    func MD5(_ string: String) -> String? {
//    //        let length = Int(CC_MD5_DIGEST_LENGTH)
//    //        var digest = [UInt8](repeating: 0, count: length)
//    //
//    //        if let d = string.data(using: String.Encoding.utf8) {
//    //            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
//    //                CC_MD5(body, CC_LONG(d.count), &digest)
//    //            }
//    //        }
//    //
//    //        return (0..<length).reduce("") {
//    //            $0 + String(format: "%02x", digest[$1])
//    //        }
//    //    }
//
//
//}
////
////extension String {
////    var md5Value: String {
////        let length = Int(CC_MD5_DIGEST_LENGTH)
////        var digest = [UInt8](repeating: 0, count: length)
////
////        if let d = self.data(using: .utf8) {
////            _ = d.withUnsafeBytes { body -> String in
////                CC_MD5(body.baseAddress, CC_LONG(d.count), &digest)
////
////                return ""
////            }
////        }
////
////        return (0 ..< length).reduce("") {
////            $0 + String(format: "%02x", digest[$1])
////        }
////    }
////}
//
//
//
//
//
//
//
//extension Data{
//
//    func aesEncrypt( keyData: Data, ivData: Data, operation: Int) -> Data {
//        let dataLength = self.count
//        let cryptLength  = size_t(dataLength + kCCBlockSizeAES128)
//        var cryptData = Data(count:cryptLength)
//
//        let keyLength = size_t(kCCKeySizeAES128)
//        let options = CCOptions(kCCOptionPKCS7Padding)
//
//
//        var numBytesEncrypted :size_t = 0
//
//        let cryptStatus = cryptData.withUnsafeMutableBytes {cryptBytes in
//            self.withUnsafeBytes {dataBytes in
//                ivData.withUnsafeBytes {ivBytes in
//                    keyData.withUnsafeBytes {keyBytes in
//                        CCCrypt(CCOperation(operation),
//                                CCAlgorithm(kCCAlgorithmAES),
//                                options,
//                                keyBytes, keyLength,
//                                ivBytes,
//                                dataBytes, dataLength,
//                                cryptBytes, cryptLength,
//                                &numBytesEncrypted)
//                    }
//                }
//            }
//        }
//
//        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
//            cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
//
//        } else {
//            print("Error: \(cryptStatus)")
//        }
//
//        return cryptData;
//    }
//
//}
//
