//
//  Backup.swift
//  SecureEncrypt&DecryptJuly509
//
//  Created by Zin Lin Htet Naing on 9/10/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//
//
//import Foundation
////
////  AES256Service.swift
////  SecureEncrypt&DecryptJuly509
////
////  Created by Zin Lin Htet Naing on 9/8/19.
////  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
////
//
//import Foundation
//import CommonCrypto
//
//protocol Cryptable {
//    func encrypt(_ digest: Data) throws -> Data
//    func decrypt(_ encrypted: Data) throws -> Data
//}
//
//struct AES {
//    private var aesKey: Data
//    private var aesIV: Data
//    public init(aesKey: Data, aesIV: Data) throws {
//        guard aesKey.count == CC_MD5_DIGEST_LENGTH else {
//            throw Error.invalidKeySize
//        }
//        guard aesIV.count == kCCBlockSizeAES128 else {
//            throw Error.invalidIVLength
//        }
//        self.aesKey = aesKey
//        self.aesIV = aesIV
//    }
//
//    private func crypt(_ input: Data, operation: CCOperation) throws -> Data {
//        var outLength = Int(0)
//        var outBytes = [UInt8](repeating: 0, count: input.count + kCCBlockSizeAES128)
//        var status: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
//        input.withUnsafeBytes { (encryptedBytes: UnsafePointer<UInt8>) -> () in
//            aesIV.withUnsafeBytes({ (ivBytes: UnsafePointer<UInt8>) in
//                aesKey.withUnsafeBytes({ (keyBytes: UnsafePointer<UInt8>) ->() in
//                    status = CCCrypt(operation, CCAlgorithm(kCCAlgorithmAES128), CCOptions(kCCOptionPKCS7Padding), keyBytes, aesKey.count, ivBytes, encryptedBytes, input.count, &outBytes, outBytes.count, &outLength)
//                })
//            })
//        }
//        guard status == kCCSuccess else {
//            throw Error.cryptoFailed(status: status)
//        }
//        return Data(bytes: UnsafePointer<UInt8>(outBytes), count: outLength)
//    }
//
//}
//
//extension AES {
//    enum Error: Swift.Error {
//        case invalidKeySize
//        case invalidIVLength
//        case cryptoFailed(status: CCCryptorStatus)
//        case encryptionFailed
//        case decryptionFailed
//        case dataToStringFailed
//    }
//}
//
//extension AES: Cryptable {
//    func encrypt(_ digest: Data) throws -> Data {
//        return try crypt(digest, operation: CCOperation(kCCEncrypt))
//    }
//
//    func decrypt(_ encrypted: Data) throws -> Data {
//        return try crypt(encrypted, operation: CCOperation(kCCDecrypt))
//    }
//}
//
////MARK: - CreateMD5Key and InputVector
//extension AES {
//    static func key() throws -> Data {
//        let length = Int(CC_MD5_DIGEST_LENGTH)
//        let keyData = Data(AES256.key.utf8)
//        var digestData = Data(count: length)
//        digestData.withUnsafeMutableBytes { (digestBytes) in
//            keyData.withUnsafeBytes({ (keyBytes) in
//                guard let keyBytesBaseAddress = keyBytes.baseAddress , let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress else { return }
//                let keyLength = CC_LONG(keyData.count)
//                CC_MD5(keyBytesBaseAddress, keyLength, digestBytesBlindMemory)
//            })
//        }
//        return digestData
//    }
//
//    static func iv() throws -> Data {
//        return Data(AES256.iv.utf8)
//    }
//}
//
//extension String {
//    func encryptAES256() -> Data {
//        var result = Data()
//        do {
//            let encryptText = self
//            let encryptData = Data(encryptText.utf8)
//            let key = try AES.key()
//            print(key)
//            let iv = try AES.iv()
//            let aes256 = try AES.init(aesKey: key, aesIV: iv)
//            let encrypted = try aes256.encrypt(encryptData)
//            result = encrypted
//        } catch {
//            print(error)
//        }
//        return result
//    }
//}
//
//extension Data {
//    func decryptAES256() -> String {
//        var result = String()
//        do {
//            let encrypted = self
//            let key = try AES.key()
//            let iv = try AES.iv()
//            let aes256 = try AES.init(aesKey: key, aesIV: iv)
//            let decrypt = try aes256.decrypt(encrypted)
//            result = String(decoding: decrypt, as: UTF8.self)
//        } catch {
//            print(error)
//        }
//        return result
//    }
//
//}
//
////MARk: - Usage
////
////@IBAction func encryptionButton(_ sender: UIButton) {
////    guard let text = encryptTextTextField.text else { return }
////    let encrypt = text.encryptAES256()
////    keepEncryptedData = encrypt
////    encryTextShowTextView.text = encrypt.base64EncodedString()
////}
////
////@IBAction func decryptionButton(_ sender: UIButton) {
////    let decrypt = keepEncryptedData.decryptAES256()
////    encryTextShowTextView.text = decrypt
////}
