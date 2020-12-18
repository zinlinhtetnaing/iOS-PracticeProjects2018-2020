////
////  AES256.swift
////  SecureEncrypt&DecryptJuly509
////
////  Created by Zin Lin Htet Naing on 7/5/19.
////  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
////
//
//import Foundation
//import CommonCrypto
//import Keys
//
////let keys = MyApplicationKeys()
////ARAnalytics.setupWithAnalytics(keys.analyticsToken)
//
//struct AES {
//
//    static let key = SecureEncryptDecryptJuly509Keys().crytoKey
////    "04E3AE56-E280-42DD-8A14-A0FB975CD3C0"
//    static let iv = SecureEncryptDecryptJuly509Keys().cryptoIV
////    "ThisIsUrPassword"
//}
//
//protocol ForEncryption {
//    static func key() -> Data
//    static func iv() -> Data
//}
//
//protocol Crypter {
//    func encrypt(_ digest: Data) -> Data?
//    func decrypt(_ encrypted: Data) -> Data?
//}
//
//struct AES256Crypter {
//    private var AESKey: Data
//    private var AESIV: Data
//
//    public init(AESKey: Data, AESIV: Data) throws {
//        print(AESKey)
//        print(AESIV)
//        guard AESKey.count == CC_MD5_DIGEST_LENGTH else {
//            throw Error.badKeyLength
//        }
//        guard AESIV.count == kCCBlockSizeAES128 else {
//            throw Error.badInputVectorLength
//        }
//        self.AESKey = AESKey
//        self.AESIV = AESIV
//    }
//
//    enum Error: Swift.Error {
//        case keyGeneration(status: Int)
//        case cryptoFailed(status: CCCryptorStatus)
//        case badKeyLength
//        case badInputVectorLength
//    }
//
//    private func crypt(input: Data, operation: CCOperation) throws -> Data {
//        var outLength = Int(0)
//        var outBytes = [UInt8](repeating: 0, count: input.count + kCCBlockSizeAES128)
//        var status: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
//        input.withUnsafeBytes { (encryptedBytes: UnsafePointer<UInt8>!) -> () in
//            AESIV.withUnsafeBytes { (ivBytes: UnsafePointer<UInt8>!) in
//                AESKey.withUnsafeBytes { (keyBytes: UnsafePointer<UInt8>!) -> () in
//                    status = CCCrypt(operation,
//                                     CCAlgorithm(kCCAlgorithmAES128),   // algorithm
//                        CCOptions(kCCOptionPKCS7Padding),               // options
//                        keyBytes,                                       // key
//                        AESKey.count,                                      // keylength
//                        ivBytes,                                        // iv
//                        encryptedBytes,                                 // dataIn
//                        input.count,                                    // dataInLength
//                        &outBytes,                                      // dataOut
//                        outBytes.count,                                 // dataOutAvailable
//                        &outLength)                                     // dataOutMoved
//                }
//            }
//        }
//        guard status == kCCSuccess else {
//            throw Error.cryptoFailed(status: status)
//        }
//        return Data(bytes: UnsafePointer<UInt8>(outBytes), count: outLength)
//    }
//
//}
//
//extension AES256Crypter: Crypter {
//
//    func encrypt(_ digest: Data) -> Data? {
//        do{
//            return try crypt(input: digest, operation: CCOperation(kCCEncrypt))
//        }catch {
//            print(error)
//        }
//        return nil
//    }
//
//    func decrypt(_ encrypted: Data) -> Data? {
//        do {
//            return try crypt(input: encrypted, operation: CCOperation(kCCDecrypt))
//        }catch {
//            print(error)
//        }
//        return nil
//    }
//
//}
//
//extension AES256Crypter: ForEncryption {
//    static func key() -> Data {
//        let length = Int(CC_MD5_DIGEST_LENGTH)
//        let keyData = Data(AES.key.utf8)
//        var digestData = Data(count: length)
//        digestData.withUnsafeMutableBytes { (digestBytes) in
//            keyData.withUnsafeBytes({ (keyBytes) in
//                guard let keyBytesBaseAddress = keyBytes.baseAddress , let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress else { return }
//                let keyLength = CC_LONG(keyData.count)
//                CC_MD5(keyBytesBaseAddress, keyLength, digestBytesBlindMemory)
//            })
//        }
//       return digestData
//    }
//
//    static func iv() -> Data {
//        return Data(AES.iv.utf8)
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////let string = ForCrypto.key
////let length = Int(CC_MD5_DIGEST_LENGTH)
////let messageData = string.data(using:.utf8)!
////var digestData = Data(count: length)
////
////digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
////    messageData.withUnsafeBytes { messageBytes -> UInt8 in
////        if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
////            let messageLength = CC_LONG(messageData.count)
////            CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
////        }
////        return 0
////    }
////}
////return digestData
