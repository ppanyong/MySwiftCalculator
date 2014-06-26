//
//  CalculatorCore.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-25.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//

import Foundation

protocol DateModifyDelegate {
    func dateModifyHandler()
}

class CalculatorCore{
    
    var operatorList:Array<String> = []{
        didSet {
            delegate?.dateModifyHandler()
        }
    }
    
    var currentNumber:String = "0"
    var delegate: DateModifyDelegate?

    //Singleton
    class var sharedInstance:CalculatorCore{
        struct Static{
            static let instance:CalculatorCore=CalculatorCore()
        }
        return Static.instance
    }
    //main
    func enterTxt(txt:String)->String{
        var tempStrArray:Array = self.currentNumber.componentsSeparatedByString(".")
        if tempStrArray.count == 1{
            if countElements(currentNumber) < 8 || txt == "." {
                var tempInt = (currentNumber).toInt()!
                if tempInt == 0 {
                    if txt == "."{
                        currentNumber = String(tempInt)+"."
                    }else{
                       currentNumber = txt
                    }
                }else{
                    currentNumber = String(tempInt)+txt
                }
            }
        }else{
            if txt == "." {
                return currentNumber
            }
            if countElements(String(tempStrArray[1]))<2{
                currentNumber = String(String(tempStrArray[0]).toInt()!)+"."+String(tempStrArray[1])+txt
            }
        }
        if operatorList.count == 0{
            operatorList.append(currentNumber)
        }else{
            if operatorList[operatorList.count-1] != "+"{
                operatorList[operatorList.count-1] = currentNumber
            }else{
                operatorList.append(currentNumber)
            }
        }
        delegate?.dateModifyHandler()
        return currentNumber
    }
    func clear(){
        currentNumber = "0"
        operatorList = []
    }
    func enterCom(operator:String){
        if operatorList.count != 0  && operatorList[operatorList.count-1] != "+"{
            operatorList.append(operator)
        }
       
        currentNumber="0"
    }
    func done()->String{
        var result:Double = 0.00
        for item in CalculatorCore.sharedInstance.operatorList {
            if(item != "+"){
                var F = (item as NSString).doubleValue
                result = result + F
            }
        }
        self.clear()
        return formatFloat(String(result))
    }
    func appendOperator(f:String){
        operatorList.append(String(f))
    }
    func formatFloat(s:String)->String{
        var tempStrArray:Array = s.componentsSeparatedByString(".")
        if tempStrArray.count == 1{
            return s
        }else{
            var n = countElements(String(tempStrArray[1]))
            if n > 2{
                n = 2
            }
            var x = String(tempStrArray[1]).substringToIndex(n)
            if x == "0" {
                return String(tempStrArray[0])
            }
            return String(tempStrArray[0]) + "." + x
        }
    }
    
}