//
//  BigCombtn.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-25.
//  Copyright (c) 2014年 yong.pan. All rights reserved.
//

import Foundation

import UIKit

class BigCombtn:Combtn{
    
    
    init(frame myframe: CGRect) {
        super.init(frame:myframe)
        self.initStyle()
    }
    override func initStyle(){
        super.initStyle()
        self.setBackgroundImage(UIImage(named:"cbigbtn"), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
        
}