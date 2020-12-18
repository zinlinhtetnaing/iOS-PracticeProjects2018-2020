//
//  CryptoService.swift
//  SecureEncrypt&DecryptJuly509
//
//  Created by Zin Lin Htet Naing on 9/8/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

//import Foundation
//
//class CryptoService {
//    
//    static var keepEncryptData = Data()
//
//    static func encryption(encryptText: String) -> Data? {
//        do {
//            if let encrypted = try AES256Crypter.init(AESKey: AES256Crypter.key(), AESIV: AES256Crypter.iv()).encrypt(Data(encryptText.utf8)) {
//                keepEncryptData = encrypted
//                return encrypted
//            }
//        } catch {
//            print(error)
//        }
//        return nil
//    }
//
//    static func decryption() -> Data? {
//        do {
//            let decrypted = try AES256Crypter.init(AESKey: AES256Crypter.key(), AESIV: AES256Crypter.iv()).decrypt(keepEncryptData)
//            return decrypted
//        } catch {
//            print(error)
//        }
//        return nil
//    }
//}
//

//print("Decrypt")
//do {
//    let iv = try AES256Crypter.createIV()
//    let key = try AES256Crypter.createKey()
//    let aes = try AES256Crypter.init(AESKey: key, AESIV: iv)
//    let decryptedData = try aes.decrypt(keepEncryptedData)
//    print(decryptedData)
//    print("Decrypted hex string: \(decryptedData.hexString)")
//    let showText = decryptedData.base64EncodedString()
//    print(showText)
//    let decrypted = String(bytes:decryptedData, encoding:String.Encoding.utf8)!
//    encryTextShowTextView.text = decrypted
//
//}
//catch {
//    print("Failed")
//    print(error)
//}



//        do {
//            let encryptText = encryptTextTextField.text!.data(using: .utf8)
//            let iv = try AES256Crypter.createIV()
//            let key = try AES256Crypter.createKey()
//            let aes = try AES256Crypter.init(AESKey: key, AESIV: iv)
//            let encryptedData = try aes.encrypt(encryptText!)
//
//            print("Encrypt")
//            print("Encrypted hex string: \(encryptedData.hexString)")
//            let showText = encryptedData.base64EncodedString()
////            let text = encryptedData.hexString
////            print(text)
//            encryTextShowTextView.text = showText
//
//            keepEncryptedData = encryptedData
//
//        }catch {
//            print("Fail")
//            print(error)
//        }

