//
//  NavigationController.swift
//  测试界面
//
//  Created by shoule on 16/5/23.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

let KEY_WINDOW:UIWindow = UIApplication.sharedApplication().keyWindow!

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func pushViewController(viewController: UIViewController, animated: Bool) {
//        let tabarController = KEY_WINDOW.rootViewController as! TabBarController
//        let tabbar = tabarController.myTabBar
//        if viewControllers.count > 0 {
//            // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
//            viewController.hidesBottomBarWhenPushed = true
//            tabbar.hidden = true
//        }
//        else{
//            tabbar.hidden = false
//        }
//        super.pushViewController(viewController, animated: true)
//    }
    
//    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
//        //一定要放在前面写，因为系统自带的这个方法默认恢复了tabBar.hidden = NO
//        let popToController = super.popViewControllerAnimated(animated)
//        let Controller = KEY_WINDOW.rootViewController;
//        if Controller is TabBarController {
//            
//            let tabarController = KEY_WINDOW.rootViewController as! TabBarController
//            let tabBar = tabarController.myTabBar
//            if viewControllers.count <= 1 {
//            // 这时即将pop出去的控制器是根控制器）
//                tabBar.hidden = false
//            }
//            tabBarController!.tabBar.hidden = true
//        }
//        return popToController
//    }
    
//    override func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
//        
//        return super.popToRootViewControllerAnimated(animated)
//    }

}
