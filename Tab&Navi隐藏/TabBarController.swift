//
//  TabBarController.swift
//  测试界面
//
//  Created by shoule on 16/5/23.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var myTabBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabBar.frame = tabBar.frame
        myTabBar.backgroundColor = UIColor.whiteColor()
        myTabBar.alpha = 0.5
        view.addSubview(myTabBar)
        
        tabBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
