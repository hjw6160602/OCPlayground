//
//  ViewController.m
//  测试界面
//
//  Created by shoule on 15/5/20.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CartData.h"

@interface CartCell : UITableViewCell{
    NSUInteger _number;
}

@property BOOL isSelectBtn;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cakeImage;
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;

@property (weak, nonatomic) IBOutlet UIButton *plusBtn;
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;

- (void)selectedFlagButton:(BOOL)select;


@end
