//
//  CakeCell.m
//  测试界面
//
//  Created by shoule on 15/6/12.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "CakeCell.h"

@implementation CakeCell

- (void)awakeFromNib {
    if (Screen_width == 414) {
        self.frame = CGRectMake(0, 0, 414, 171);
    }
    NSLog(@"awakeFromNib---cell.width:%f",self.frame.size.width);
}

-(void)layoutSubviews{
    NSLog(@"layoutSubviews---cell.width:%f",self.frame.size.width);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
