//
//  testCostomColor.swift
//  testCode
//
//  Created by Ohshima You on 2019/06/11.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import UIKit

import UIKit
import Foundation

extension UIColor {
    class func loginViewBgColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func commentViewBgColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func loginButtonColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 200, b: 255, alpha: 1.0)
    }
    
    class func submitButtonColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func validationViewBorderColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func normalButtonGradationTopColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func normalButtonGradationBottomColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func backButtonColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func reLoadButtonGradationTopColor() -> UIColor {
        return UIColor.rgb(r: 100, g: 100, b: 100, alpha: 1.0)
    }
    
    class func reLoadButtonGradationBottomColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func customButtonTextShadowColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 0.08)
    }
    
    class func customButtonShadowColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 0.16)
    }
    
    class func loginBackWhiteViewShadowColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 0.08)
    }
    
    class func loginTextFieldColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func loginTextFieldBorderColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func registerTableBorderColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func areaLightGrayFontColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func areaBlackFontColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func blackFontColor() -> UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255, alpha: 1.0)
    }
    
    class func rgbColor(rgbValue: UInt) -> UIColor {
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func rgb(r: CGFloat,g: CGFloat, b: CGFloat,alpha: CGFloat) -> UIColor {
        var red = Double(r),green = Double(g),blue = Double(b),a = Double(alpha)
        if r > 1.0 { red = Double(r / 255.0) }
        if g > 1.0 { green = Double(g / 255.0) }
        if b > 1.0 { blue = Double(b / 255.0) }
        if alpha > 1.0 { a = Double(alpha / 255.0) }
        return UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(a)
        )
    }
}
