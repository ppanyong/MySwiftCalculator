//
//  CalbtnFactory.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-21.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//

import Foundation
import UIKit
class CalbtnFactory{
    
         
    
    class func createCalbtn(btnCode:Btnenum,btnframe:CGRect) -> Calbtn{
        
        switch btnCode{
        case .Dot:
            var calbtn:Combtn = Combtn(frame:btnframe)
            calbtn.setTitle(".", forState: UIControlState.Normal)
            calbtn.setBackgroundImage(UIImage(named:"btn"), forState: UIControlState.Normal)
            calbtn.btnenum = btnCode
            return calbtn
            
        case .Plus:
            var calbtn:Combtn = Combtn(frame:btnframe)
            calbtn.setTitle("+", forState: UIControlState.Normal)
            calbtn.setBackgroundImage(UIImage(named:"btn"), forState: UIControlState.Normal)
            calbtn.btnenum = btnCode
            return calbtn
            
        case .Back:
            var calbtn:Combtn = Combtn(frame:btnframe)
            calbtn.setTitle("", forState: UIControlState.Normal)
            calbtn.setBackgroundImage(UIImage(named:"backbtn"), forState: UIControlState.Normal)
            calbtn.btnenum = btnCode
            return calbtn
            
        case .Clear:
            var calbtn:Combtn = Combtn(frame:btnframe)
            calbtn.titleLabel.font = UIFont.systemFontOfSize(18)
            calbtn.setTitle("清空", forState: UIControlState.Normal)
            calbtn.btnenum = btnCode
            return calbtn
            
        case .Done:
            var cgr:CGRect = btnframe
            cgr.size.height = cgr.size.height*2

            var calbtn:BigCombtn = BigCombtn(frame:cgr)
            calbtn.setTitle("=", forState: UIControlState.Normal)
            calbtn.btnenum = btnCode
            return calbtn
            
        default:
            var calbtn:Numbtn = Numbtn(frame:btnframe)
            calbtn.setTitle(String(btnCode.toRaw()), forState: UIControlState.Normal)
            calbtn.btnenum = btnCode
            return calbtn
            
        }
    }
}