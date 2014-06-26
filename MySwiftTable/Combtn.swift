//
//  Combtn.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-21.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//

import UIKit

class Combtn:Calbtn{
    
    
    init(frame myframe: CGRect) {
        super.init(frame:myframe)
        self.initStyle()
    }
    override func initStyle(){
        super.initStyle()
        
        self.setBackgroundImage(UIImage(named:"cbtn"), forState: UIControlState.Normal)
        
    }
    override func getType()->String{
        return Calbtn.COMBTN
    }
    
    
}
