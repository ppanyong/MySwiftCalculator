//
//  Util.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-25.
//  Copyright (c) 2014年 yong.pan. All rights reserved.
//

import Foundation
import UIKit

class Util{
    class func colorWithHexValue(hexValue:UInt32)->UIColor{
        var redComponent:CGFloat = CGFloat(UInt(arc4random_uniform(hexValue & 0xFF0000)) >> 16)/255.0
        var greenComponent:CGFloat = CGFloat(UInt(arc4random_uniform(hexValue & 0x00FF00)) >> 8)/255.0
        var blueComponent:CGFloat = CGFloat(UInt(arc4random_uniform(hexValue & 0x0000FF)))/255.0
        var alphaComponent:CGFloat = 1
        var color:UIColor! = UIColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha:alphaComponent)
        println(redComponent)
        return color
    }

}