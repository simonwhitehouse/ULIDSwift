//
//  ULID.swift
//  ULID
//
//  Created by Simon Whitehouse on 18/05/2017.
//  Copyright © 2017 Crugo. All rights reserved.
//

import Foundation


public extension String {
    
    static func generateULID(timeStamp: Double? = nil) -> String {
        return ULID.generateULID(timeStamp: timeStamp)
    }
    
}

/// ULID
struct ULID {
    
    let t: String
    let r: String
    
    
    
    // Crockford's Base32
    // https://en.wikipedia.org/wiki/Base32
    static let encodingChars = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
    static let encodedArray = encodingChars.characters.map { String($0) }
    static let encodingLength: Double = Double(encodedArray.count)
    
    /// random part of the ULID
    static func encodeRandom(length: Int) -> String {
        
        var str = ""
        for _ in (0..<length).reversed() {
            let rand = floor(encodingLength * Double.random(in: 0...1))
            str = encodedArray[Int(rand)] + str
        }
        
        return str
    }
    
    /// time stamp part of the ULID
    static func encodeTime(time: Double, length: Int) -> String {
        var chaingTime = time
        var xstr = ""
        
        for _ in (0..<length).reversed() {
            let mod: Int = Int(chaingTime.truncatingRemainder(dividingBy: encodingLength))
            xstr = encodedArray[mod] + xstr
            chaingTime = (chaingTime - Double(mod)) / encodingLength
        }
        
        return xstr
    }
    
    static func generateULID(timeStamp: Double? = nil) -> String {
        let now = timeStamp ?? (Date().timeIntervalSince1970*1000)
        return encodeTime(time: now, length: 10) + encodeRandom(length: 16)
    }
    
    
    init(timeStamp: Double? = nil) {
        let now = timeStamp ?? (Date().timeIntervalSince1970*1000)
        self.t = ULID.encodeTime(time: now, length: 10)
        self.r = ULID.encodeRandom(length: 16)
    }
    
}
