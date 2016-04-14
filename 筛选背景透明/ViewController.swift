//
//  ViewController.swift
//  筛选背景透明
//
//  Created by shoule on 16/4/14.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /** 让控制器拥有Window */
    let coverWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnClick(sender: AnyObject) {
        let screeningView = NSBundle.mainBundle().loadNibNamed("ScreeningView", owner: self, options: nil).first as! UIView
        print(screeningView.subviews.count)
        
        coverWindow.hidden = false
        coverWindow.alpha = 1
        coverWindow.backgroundColor = UIColor.clearColor()
        coverWindow.addSubview(screeningView)
    }
}

