//
//  NormalViewController.m
//  BestCake3.0
//
//  Created by 123 on 15-4-17.
//  Copyright (c) 2015年 shoule. All rights reserved.
//

#import "NormalViewController.h"

UIWindow* _sheetWindow;
@implementation NormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tabBarController.tabBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.tabBarController.tabBar setHidden:NO];
}

-(void)createDatePickView{
    _sheetWindow=[[UIWindow alloc]init];
    [_sheetWindow setHidden:NO];
    _sheetWindow.windowLevel = UIWindowLevelStatusBar;
    _sheetWindow.hidden = NO;
    _sheetWindow.frame=CGRectMake(0, 0, Screen_width, Screen_height);
    UIView* backView = [[UIView alloc] initWithFrame:_sheetWindow.bounds];
    backView.backgroundColor=[UIColor blackColor];
    backView.alpha=0.5;
    [_sheetWindow addSubview:backView];

    UIDatePicker* pickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, Screen_height-180, Screen_width, 180)];

    [self datePickerValueChanged:pickerView];
    [pickerView addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    pickerView.datePickerMode = UIDatePickerModeDate;
    pickerView.backgroundColor=[UIColor whiteColor];
    [_sheetWindow addSubview:pickerView];
    UIView* buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_height-210, Screen_width, 30)];
    buttonView.backgroundColor=[UIColor whiteColor];
    [_sheetWindow addSubview:buttonView];
    self.ensureButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.ensureButton.frame=CGRectMake(Screen_width-10-40, 0, 40, 30);
    
    [self.ensureButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.ensureButton setTitleColor:[UIColor colorWithRed:204/255.0 green:15/255.0 blue:0 alpha:1] forState:UIControlStateNormal];
    [buttonView addSubview:self.ensureButton];
    self.cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor colorWithRed:204/255.0 green:15/255.0 blue:0 alpha:1] forState:UIControlStateNormal];
    self.cancelButton.frame=CGRectMake(10, 0, 40, 30);
    [buttonView addSubview:self.cancelButton];
    
}

-(void)datePickerValueChanged:(UIDatePicker*)datePicker
{
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSLog(@"llllldate == %@",datePicker.date);
    self.locationString=[dateformatter stringFromDate:datePicker.date];
    
}

-(void)createPickView
{
    
    _sheetWindow=[[UIWindow alloc]init];
    [_sheetWindow setHidden:NO];
    _sheetWindow.windowLevel = UIWindowLevelStatusBar;
    _sheetWindow.hidden = NO;
    _sheetWindow.frame=CGRectMake(0, 0, Screen_width, Screen_height);
    UIView* backView = [[UIView alloc] initWithFrame:_sheetWindow.bounds];
    backView.backgroundColor=[UIColor blackColor];
    backView.alpha=0.5;
    [_sheetWindow addSubview:backView];

    UIView* buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_height-210, Screen_width, 30)];
    buttonView.backgroundColor=[UIColor whiteColor];
    [_sheetWindow addSubview:buttonView];
    self.ensureButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.ensureButton.frame=CGRectMake(Screen_width-10-40, 0, 40, 30);
    
    [self.ensureButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.ensureButton setTitleColor:[UIColor colorWithRed:204/255.0 green:15/255.0 blue:0 alpha:1] forState:UIControlStateNormal];
    [buttonView addSubview:self.ensureButton];
    self.cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor colorWithRed:204/255.0 green:15/255.0 blue:0 alpha:1] forState:UIControlStateNormal];
    self.cancelButton.frame=CGRectMake(10, 0, 40, 30);
    [buttonView addSubview:self.cancelButton];
}

-(void)removeWindow
{
    [_sheetWindow setHidden:YES];
    [_sheetWindow removeFromSuperview];
    
    _sheetWindow=nil;
}

- (void)makeTabBarHidden:(BOOL)hide{
    if ( [self.tabBarController.view.subviews count] < 2 )
        return;
    
    UIView *contentView;
    
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    
    if ( hide )
        contentView.frame = self.tabBarController.view.bounds;
    else
        contentView.frame = CGRectMake(self.tabBarController.view.bounds.origin.x,
                                       self.tabBarController.view.bounds.origin.y,
                                       self.tabBarController.view.bounds.size.width,
                                       self.tabBarController.view.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    
    self.tabBarController.tabBar.hidden = hide;
}


- (void)showHudTitle:(NSString *)title {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = title;
    [HUD show:YES];
    
    //[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

-(void)hideHUD{
    [HUD hide:YES];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    [HUD removeFromSuperview];
}

//-(void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:nil];
//}

@end