//
//  BirthdayCardCell.swift
//  测试界面
//
//  Created by shoule on 16/4/27.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import UIKit

class BirthdayCardCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension BirthdayCardCell: UITextFieldDelegate{
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("textField shouldChangeCharactersInRange")
        return true
    }
}