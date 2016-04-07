//
//  ViewController.swift
//  Tab&Navi隐藏
//
//  Created by shoule on 16/4/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let Controller = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnClick(sender: AnyObject) {
//        self.hidesBottomBarWhenPushed = true
        Controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(Controller, animated: true)
    }

    

}

