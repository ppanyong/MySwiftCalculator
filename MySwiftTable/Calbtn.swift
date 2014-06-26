//
//  Calbtn.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-19.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//

import UIKit

class Calbtn:UIButton{
    
    class var NUMBERBTN: String{
    return "numberbtn"
    }
    class var COMBTN: String{
    return "combtn"
    }
    class var BIGCOMBTN: String{
    return "bigbtn"
    }
    
    var btnenum:Btnenum?

    
    init(frame myframe: CGRect) {
        super.init(frame:myframe)
        self.initStyle()
    }
    
    func getType()->String{
        return Calbtn.NUMBERBTN
    }
    
    func initStyle(){
        self.titleLabel.font = UIFont(name: "HelveticaNeue-Thin",size: 32)
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
    }
    
    
}
