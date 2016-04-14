//
//  ViewController.swift
//  大众AutoLayout题目
//
//  Created by shoule on 16/4/12.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var midView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func TapClick(sender:AnyObject){
        midView?.hidden = true
        print("123")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

