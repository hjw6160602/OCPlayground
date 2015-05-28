//
//  ExtraCartCell.m
//  测试界面
//
//  Created by shoule on 15/5/21.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "ExtraCartCell.h"

@implementation ExtraCartCell

- (void)awakeFromNib {
    _numberLabel.layer.borderWidth = 1.0f;
    _numberLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _isSelectBtn = NO;
}

- (void)selectedFlagButton:(BOOL)select{
    if (select)
        [_selectImage setImage:[UIImage imageNamed:@"ico-torlly-check.png"]];
    else
        [_selectImage setImage:[UIImage imageNamed:@"ico-torlly-ncheck.png"]];
    _isSelectBtn = select;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
