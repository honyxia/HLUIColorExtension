//
//  UIColorExtension.swift
//  HLUIColorExtension
//
//  Created by hony on 16/12/7.
//  Copyright © 2016年 hony. All rights reserved.
//

import UIKit

extension UIColor {
    // add convenience initializer
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    // convert hexadecimal string to RGB value
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        // get the length of string
        guard hex.characters.count >= 6 else {
            return nil
        }
        
        // Convert to uppercased
        var tempHex = hex.uppercased()
        
        // prefix 0X/##/#
        if tempHex.hasPrefix("0X") || tempHex.hasPrefix("##") {
            tempHex = (tempHex as NSString).substring(from: 2)
        }
        
        if tempHex.hasPrefix("#") {
            tempHex = (tempHex as NSString).substring(from: 1)
        }
        
        // cut the string，get the R、G、B separately
        var range = NSRange(location: 0, length: 2)
        let rHex = (tempHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)
        
        // convert the hex string to number
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        // convert NSString object to number, pass an UInt32 type address
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
    }
    
    // class function, random the color
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
