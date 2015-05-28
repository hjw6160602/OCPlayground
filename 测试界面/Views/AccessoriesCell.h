//
//  AccessoriesCell.h
//  测试界面
//
//  Created by shoule on 15/5/22.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccessoriesCell : UITableViewCell{
    NSUInteger _candleNo;
    NSUInteger _tablewareNo;
    

}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tablewareNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *candleNoLabel;
@property (weak, nonatomic) IBOutlet UIButton *twMinusBtn;
@property (weak, nonatomic) IBOutlet UIButton *twPlusBtn;
@property (weak, nonatomic) IBOutlet UIButton *cdMinusBtn;
@property (weak, nonatomic) IBOutlet UIButton *cdPlusBtn;
@property (assign) NSUInteger price;

@end
