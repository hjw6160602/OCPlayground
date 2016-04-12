//
//  SecondViewController.swift
//  奇怪的PriceBar
//
//  Created by shoule on 16/4/8.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let SCREEN_FRAME  = UIScreen.mainScreen().bounds
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.width
    
//    var priceBar:PriceBar = (NSBundle.mainBundle().loadNibNamed("PriceBar", owner: nil, options: nil).first as? PriceBar)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let priceBar = NSBundle.mainBundle().loadNibNamed("PriceBar", owner: nil, options: nil).first as! UIView
        priceBar.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 51);
        
        view.addSubview(priceBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

