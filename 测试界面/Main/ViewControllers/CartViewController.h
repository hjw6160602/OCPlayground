//
//  CartViewController.h
//  测试界面
//
//  Created by shoule on 15/5/20.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalViewController.h"

#define CART_CELL_ID @"CartCell"
#define EXTRA_CART_CELL_ID @"ExtraCartCell"
#define ACCESSORIES_CELL_ID @"AccessoriesCell"

#define CART_PLUS             100000
#define CART_MINUS            110000
#define EXTRA_PLUS            200000
#define EXTRA_MINUS           210000
#define TABLEWARE_PLUS        300000
#define TABLEWARE_MINUS       310000
#define CANDLE_PLUS           400000
#define CANDLE_MINUS          410000

#define TABLEWARE_PRICE       5
#define CANDLE_PRICE          2

@interface CartViewController : NormalViewController <UITableViewDelegate, UITableViewDataSource>{
    NSUInteger _section,_row;
    
    NSMutableArray *_cellSelectedArray; //标记主购物车Section中cell选中的数组
    NSMutableArray *_addSelectedArray;  //标记加购价Section中cell选中的数组
    
    __weak IBOutlet UIImageView *_allPickImage;
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UILabel *_sumPrice;
    
    BOOL _isSelectedAllPick;

}

@property (strong, nonatomic) IBOutlet UIView *footerView;

- (IBAction)AllPick:(UIButton *)sender;

@end
