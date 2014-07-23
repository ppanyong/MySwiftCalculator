//
//  CalculatorViewController.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-19.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//


import UIKit

class CalculatorViewController: UIViewController,DateModifyDelegate{
    
    var commandPane:UIView! = UIView()
    let commandPaneY:CGFloat = 90*UIScreen.mainScreen().scale
    let commandPaneColor:UIColor = Util.colorWithHexValue(0x31333c)
    var commandbtns_firstline:Array<Btnenum> = [Btnenum.One,Btnenum.Two,Btnenum.Three,Btnenum.Back]
    var commandbtns_secondline:Array<Btnenum> = [Btnenum.Four,Btnenum.Five,Btnenum.Six,Btnenum.Clear]
    var commandbtns_thirdline:Array<Btnenum> = [Btnenum.Seven,Btnenum.Eight,Btnenum.Nine,Btnenum.Done]
    var commandbtns_fourline:Array<Btnenum> = [Btnenum.Zero,Btnenum.Dot,Btnenum.Plus]

    var showText:UILabel! = UILabel()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view.backgroundColor = commandPaneColor
        commandPane = self.initCommandPane()
        self.initCommandBtnLayout(commandPane)
        self.view.addSubview(commandPane)
        
        self.initshowText()
        
        
        CalculatorCore.sharedInstance.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCommandPane() -> UIView{
        var temp:UIView! = UIView(frame:CGRectMake(0, commandPaneY, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame)-commandPaneY)) //as UIView
        temp.backgroundColor = commandPaneColor
        return temp
    }
    func initshowText(){
        showText = UILabel(frame:CGRectMake(10,110,self.view.frame.size.width-20,50))
        showText.backgroundColor = UIColor.clearColor()
        showText.textAlignment = NSTextAlignment.Right
        showText.textColor = UIColor.whiteColor()
        showText.font = UIFont(name: "HelveticaNeue-Thin",size: 44)
        showText.text = "0"
        self.view.addSubview(showText)
    }
    func clearText(){
        showText.text = "0"
    }
    
    func getLineBtnByIndex(index:Int)->Array<Btnenum>{
        switch index {
        case 0:
            return commandbtns_firstline
        case 1:
            return self.commandbtns_secondline
        case 2:
            return self.commandbtns_thirdline
        case 3:
            return self.commandbtns_fourline
        default:
            return self.commandbtns_firstline
        }
    }
    
    func initCommandBtnLayout(contentView:UIView){
        let colNumber:Int = 4
        let rowNumber:Int = 4
        var btnWidth:Int = Int((CGRectGetWidth(commandPane.frame))/CGFloat(rowNumber))
        var btnHeight:Int = Int((CGRectGetHeight(commandPane.frame))/CGFloat(colNumber))
        var row: Int = 0
        var col:Int = 0
        for row = 0; row < rowNumber; ++row {

            var tempRow:Array<Btnenum> = self.getLineBtnByIndex(row)
            //println(tempRow.count)
            for col = 0; col < tempRow.count;++col{
                var btnRect:CGRect = CGRectMake(CGFloat(col*btnWidth), CGFloat(row*btnHeight), CGFloat(btnWidth-1), CGFloat(btnHeight-1))
                contentView.addSubview(self.createButton(btnRect,btncode: tempRow[col] as Btnenum))

            }
        }
        
        
    }
    
    
    func createButton(frame:CGRect,btncode:Btnenum) ->UIButton {
        var orginY:CGFloat = 0
        var button:Calbtn = CalbtnFactory.createCalbtn(btncode, btnframe: frame)
        button.addTarget(self, action:"tappedButton:", forControlEvents:UIControlEvents.TouchUpInside)
        return button
    }
    
    var currentNumber:String = "0"
    
    func tappedButton(inSender:AnyObject){
        var btn:Calbtn = inSender as Calbtn
        var b:Btnenum = btn.btnenum!
        if btn.getType() == Calbtn.NUMBERBTN {
            var txt = String(b.toRaw())
            self.updateCurrentNumber(txt)
        }
        if btn.getType() == Calbtn.COMBTN{
            switch b.simpleDescription(){
            case ".":
                self.updateCurrentNumber(".")
            case "Clear":
                self.doClearCommend()
            case "Back":
                self.doClearCommend()
            case "+":
                self.doPlusCommend()
            case "Done":
                self.doEqualCommend()
            default:
                var txt = String(b.simpleDescription())
            }
            
        }
        
    }
    func calShowText(s:String){
        self.showText.text = s
        var slength = countElements(s)
        var z:Float = Float(slength)-10
        var p:Float = 1
        if(z>0){
            p = 1-z*0.05
        }
        var size:CGFloat = CGFloat( 44*p)
        showText.font = UIFont(name: "HelveticaNeue-Thin",size: size)

    }
    func updateCurrentNumber(txt:String){
         CalculatorCore.sharedInstance.enterTxt(txt)
    }
    func dateModifyHandler(){
        var text:String = ""
        for item in CalculatorCore.sharedInstance.operatorList {
            text += String(item)
        }
        calShowText(text)
    }
    func doClearCommend(){
        CalculatorCore.sharedInstance.clear()
        self.clearText()
    }
    func doEqualCommend(){
        if(CalculatorCore.sharedInstance.operatorList.count<2){
            showText.text = CalculatorCore.sharedInstance.currentNumber
        }else{
            var result = CalculatorCore.sharedInstance.done()
            showText.text = "="+result
        }
    }
    func doPlusCommend(){
        CalculatorCore.sharedInstance.enterCom("+")
    }

}