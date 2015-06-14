//
//  TableViewController.m
//  测试界面
//
//  Created by shoule on 15/6/12.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "TableViewController.h"
#import "CakeCell.h"
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 171.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"Identifier";
    CakeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CakeCell" owner:self options:nil]lastObject];
    }
    cell.detailLabel.text = @"我是测试数据！我是测试数据！我是测试数据！我是测试数据！我是测试数据！我是测试数据！";
    NSLog(@"cellForRowAtIndexPath---cell.width:%f",cell.frame.size.width);
    return cell;
}

@end
