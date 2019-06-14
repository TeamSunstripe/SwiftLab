//
//  String+CryptoAlgorithm.swift
//  testCode
//
//  Created by Oshima You on 2019/06/12.
//  Copyright © 2019年 Team SunStripe. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Digest
    public var md2: String? {
        return hashData?.md2.hex
    }
    
    public var md4: String? {
        return hashData?.md4.hex
    }
    
    public var md5: String? {
        return hashData?.md5.hex
    }
    
    public var sha1: String? {
        return hashData?.sha1.hex
    }
    
    public var sha224: String? {
        return hashData?.sha224.hex
    }
    
    public var sha256: String? {
        return hashData?.sha256.hex
    }
    
    public var sha384: String? {
        return hashData?.sha384.hex
    }
    
    public var sha512: String? {
        return hashData?.sha512.hex
    }
    
    // MARK: - HMAC
    public func hmac(key: String, algorithm: HMAC.Algorithm) -> String? {
        return HMAC.sign(message: self, algorithm: algorithm, key: key)
    }
    
    // MARK: - Private
    private var hashData: Data? {
        return data(using: .utf8)
    }
}
