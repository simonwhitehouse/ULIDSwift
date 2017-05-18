//: Playground - noun: a place where people can play

import UIKit

public extension Double {
    
    /// Returns value between 0.0 and 1.0, inclusive.
    public static var random: Double {
        get {
            return Double(arc4random()) / 0xFFFFFFFF
        }
    }
}

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
            let rand = floor(encodingLength * Double.random)
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
        let now = timeStamp ?? (Date().timeIntervalSince1970)
        return encodeTime(time: now, length: 10) + encodeRandom(length: 16)
    }
    
    
    init(timeStamp: Double? = nil) {
        let now = timeStamp ?? (Date().timeIntervalSince1970)
        self.t = ULID.encodeTime(time: now, length: 10)
        self.r = ULID.encodeRandom(length: 16)
    }
    
}


let a = String.generateULID(timeStamp: nil)
let b = String.generateULID(timeStamp: nil)
let x = ULID.generateULID()
let y = ULID.generateULID(timeStamp: 1469918176385)
let ulid = ULID(timeStamp: nil)
let ulidTime = ulid.t
let ulidRandom = ulid.r




