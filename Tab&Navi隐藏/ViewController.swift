//
//  ViewController.swift
//  Tab&Navi隐藏
//
//  Created by shoule on 16/4/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var midView: UIView!
    let Controller = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func OnClick(sender: AnyObject) {
//        self.hidesBottomBarWhenPushed = true
        Controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(Controller, animated: true)
    }

    

}

