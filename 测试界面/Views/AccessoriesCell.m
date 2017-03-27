//
//  AccessoriesCell.m
//  测试界面
//
//  Created by shoule on 15/5/22.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "AccessoriesCell.h"

@implementation AccessoriesCell

- (void)awakeFromNib {
    _candleNoLabel.layer.borderWidth = 1.0f;
    _candleNoLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _tablewareNoLabel.layer.borderWidth = 1.0f;
    _tablewareNoLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
