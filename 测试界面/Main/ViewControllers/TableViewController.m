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
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 171.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(20, 0, Screen_width - 40, 3)];
    lineView.layer.masksToBounds = YES;
    [cell.contentView addSubview:lineView];
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = lineView.bounds;
    [lineView.layer addSublayer:replicator];
    replicator.instanceCount = 40;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 8, 0, 0);
    replicator.instanceTransform = transform;
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, 3, 3);
    imageLayer.contents = (__bridge id)([UIImage imageNamed:@"ico-ticket-point.png"].CGImage);
    [replicator addSublayer:imageLayer];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(lineView.frame) + 13, Screen_width - 40, 138)];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    backView.layer.borderWidth = 1.0f;
    [cell.contentView addSubview:backView];
    return cell;
}

@end
