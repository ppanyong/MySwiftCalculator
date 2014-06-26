//
//  Numbtn.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-24.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//



import UIKit

class Numbtn:Calbtn{
    init(frame myframe: CGRect) {
        super.init(frame:myframe)
        self.initStyle()
    }
    override func initStyle(){
        super.initStyle()
        
        self.setBackgroundImage(UIImage(named:"btn"), forState: UIControlState.Normal)
        
    }
    override func getType()->String{
        return Calbtn.NUMBERBTN
    }
    
}

