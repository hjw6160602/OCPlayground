//
//  LayerAnimateController.m
//  测试界面
//
//  Created by shoule on 15/8/18.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "LayerAnimateController.h"

@interface LayerAnimateController ()
@property (weak, nonatomic) IBOutlet UIImageView *checkImg;
@end

@implementation LayerAnimateController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didSelectedCheck:(UITapGestureRecognizer *)sender {
    NSLog(@"checked");
}


@end
