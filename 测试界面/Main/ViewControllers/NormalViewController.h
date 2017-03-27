//
//  NormalViewController.h
//  BestCake3.0
//
//  Created by 123 on 15-4-17.
//  Copyright (c) 2015年 shoule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NormalViewController : UIViewController<MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
    
}

@property (strong, nonatomic)UIButton* cancelButton;
@property (strong, nonatomic)UIButton* ensureButton;
@property (strong, nonatomic)NSString *  locationString;

- (void)showHudTitle:(NSString *)title;
- (void)hideHUD;
- (void)makeTabBarHidden:(BOOL)hide;
- (void)createPickView;
- (void)removeWindow;

-(void)createDatePickView;
@end