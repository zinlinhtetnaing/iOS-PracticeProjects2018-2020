//
//  AES256Service.swift
//  SecureEncrypt&DecryptJuly509
//
//  Created by Zin Lin Htet Naing on 9/8/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import CommonCrypto

extension AES {
    enum CryptType {
        case encrypt
        case decrypt
    }

    enum Error: Swift.Error {
        case invalidKeySize
        case invalidIVLength
        case cryptoFailed(status: CCCryptorStatus)
        case encryptionFailed
        case decryptionFailed
        case dataToStringFailed
        case ivIsNotHave
    }
}

protocol Cryptable {
    func encrypt(_ digest: String) throws -> String
    func decrypt(_ encrypted: String) throws -> String
}

struct AES {
    private var aesKey: Data
    private var aesIV: Data
    public init(aesKey: Data, aesIV: Data) throws {
        guard aesKey.count == CC_MD5_DIGEST_LENGTH else { throw Error.invalidKeySize }
        guard aesIV.count == kCCBlockSizeAES128 else { throw Error.invalidIVLength }
        self.aesKey = aesKey
        self.aesIV = aesIV
    }

    private func crypt(cryptType: CryptType ,_ inputString: String, operation: CCOperation) throws -> String {
        var inputStringToData = Data()
        switch cryptType {
        case .encrypt: inputStringToData = inputString.data
        case .decrypt: inputStringToData = inputString.base64Decoded }
        var outLength = Int(0)
        var outBytes = [UInt8](repeating: 0, count: inputStringToData.count + kCCBlockSizeAES128)
        var status: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
        inputStringToData.withUnsafeBytes { (encryptedBytes: UnsafePointer<UInt8>) -> () in
            aesIV.withUnsafeBytes({ (ivBytes: UnsafePointer<UInt8>) in
                aesKey.withUnsafeBytes({ (keyBytes: UnsafePointer<UInt8>) ->() in
                    status = CCCrypt(operation, CCAlgorithm(kCCAlgorithmAES128), CCOptions(kCCOptionPKCS7Padding), keyBytes, aesKey.count, ivBytes, encryptedBytes, inputStringToData.count, &outBytes, outBytes.count, &outLength)
                })
            })
        }
        guard status == kCCSuccess else { throw Error.cryptoFailed(status: status) }
        if cryptType == .encrypt {
            return Data(bytes: UnsafePointer<UInt8>(outBytes), count: outLength).base64EncodedString()
        }
        guard let dataToString = Data(bytes: UnsafePointer<UInt8>(outBytes), count: outLength).string else {
            return "\(Error.dataToStringFailed)"
        }
        return dataToString
    }
}

extension AES: Cryptable {
    func encrypt(_ digest: String) throws -> String {
        return try crypt(cryptType: CryptType.encrypt, digest, operation: CCOperation(kCCEncrypt))
    }

    func decrypt(_ encrypted: String) throws -> String {
        return try crypt(cryptType: CryptType.decrypt, encrypted, operation: CCOperation(kCCDecrypt))
    }
}

extension AES {
    static func key() throws -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let keyData = Data(AES256.key.utf8)
        var digestData = Data(count: length)
        digestData.withUnsafeMutableBytes { (digestBytes) in
            keyData.withUnsafeBytes({ (keyBytes) in
                guard let keyBytesBaseAddress = keyBytes.baseAddress , let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress else { return }
                let keyLength = CC_LONG(keyData.count)
                CC_MD5(keyBytesBaseAddress, keyLength, digestBytesBlindMemory)
            })
        }
        return digestData
    }
    
    static func iv() throws -> Data {
        return AES256.iv.data
//        return randomIV(length: kCCBlockSizeAES128)
    }

    static func randomIV(length: Int) -> Data {
        var data = Data(count: length)
        let status = data.withUnsafeMutableBytes { mutableBytes in
            SecRandomCopyBytes(kSecRandomDefault, length, mutableBytes)
        }
        assert(status == Int32(0))
        return data
    }
}

extension String {
    func encryptAES256() -> String {
        var result = String()
        do {
            let encryptText = self
            let key = try AES.key()
            let iv = try AES.iv()
//            UserDefaults.standard.set(try AES.iv(), forKey: "ivKey")
//            UserDefaults.standard.synchronize()
//            guard let iv = UserDefaults.standard.data(forKey: "ivKey") else { return "\(AES.Error.ivIsNotHave)" }
            let aes256 = try AES.init(aesKey: key, aesIV: iv)
            let encrypted = try aes256.encrypt(encryptText)
            result = encrypted
        } catch {
            print(error)
        }
        return result
    }

    func decryptAES256() -> String {
        var result = String()
        do {
            let encrypted = self
            let key = try AES.key()
            let iv = try AES.iv()
//            guard let iv = UserDefaults.standard.data(forKey: "ivKey") else { return "\(AES.Error.ivIsNotHave)" }
            let aes256 = try AES.init(aesKey: key, aesIV: iv)
            let decrypt = try aes256.decrypt(encrypted)
            result = decrypt
        } catch {
            print(error)
        }
        return result
    }
}

extension String {
    var data: Data { return Data(utf8) }
    var base64Encoded: Data { return data.base64EncodedData() }
    var base64Decoded: Data { return Data(base64Encoded: self)! }
}

extension Data {
    var string: String? { return String(data: self, encoding: .utf8) }
}


