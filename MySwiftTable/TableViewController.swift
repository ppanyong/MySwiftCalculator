//
//  TableViewController.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-18.
//  Copyright (c) 2014年 yong.pan. All rights reserved.
//

//
//  TableViewController.swift
//  Tableswift
//
//  Created by yong.pan on 14-6-18.
//  Copyright (c) 2014 yong.pan. All rights reserved.
//


import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var items: [String] = ["计算器","CoreGraphics"]

    var tableView: UITableView!
    var viewMoveBlock: UIView! = UIView()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self._initTableView()
        self.view.addSubview(self.tableView)
        
            }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func _initTableView(){
        //TableView的创建和设置
        self.tableView=UITableView(frame:CGRectMake(0,20,CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame)-64))
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.autoresizingMask = UIViewAutoresizing.FlexibleHeight|UIViewAutoresizing.FlexibleWidth
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier:"cell")
        self.view?.addSubview(self.tableView)
        self.tableView!.separatorColor = UIColor.blackColor()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.text = self.items[indexPath.row]
        
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")
        switch indexPath.row{
        case 0:
            self.gotoCalculator()
        default:
            self.gotoCGView()
           return
        }
        
        
    }
    func gotoCGView(){
        var cgCtrl:CoreGraphicsViewController! = CoreGraphicsViewController(nibName: nil, bundle: nil)
        cgCtrl.title="CoreGraphics练习"
        self.navigationController.pushViewController(cgCtrl, animated: true)
    }
    func gotoCalculator(){
        
        var listCtrl:CalculatorViewController! = CalculatorViewController(nibName: nil, bundle: nil)
        listCtrl.title = "计算器"
        //listCtrl.view.backgroundColor = UIColor.whiteColor()

        self.navigationController.pushViewController(listCtrl!, animated: true)
    }
    
    
}
