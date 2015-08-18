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
@property (nonatomic, strong) CALayer *mask;
@property CGFloat OffsetFloat;
@end

@implementation LayerAnimateController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControls];
}

- (void)initControls{
    //新建tap手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectedCheck:)];
    //设置点击次数和点击手指数
    //    tapGesture.numberOfTapsRequired = 1; //点击次数
    //    tapGesture.numberOfTouchesRequired = 1; //点击手指数
    [self.view addGestureRecognizer:tapGesture];
    
    self.OffsetFloat = self.checkImg.frame.size.width;
    self.mask = [[CALayer alloc]init];
    self.mask.frame = self.checkImg.bounds;
    self.mask.transform = CATransform3DMakeTranslation(-_OffsetFloat, 0, 0);
    self.mask.backgroundColor = [UIColor whiteColor].CGColor;
    self.checkImg.layer.mask = self.mask;
//    [self.checkImg.layer addSublayer:_mask];
}
- (void) didSelectedCheck:(UITapGestureRecognizer *)sender {
    NSLog(@"checked");
//    CABasicAnimation *animation = [CABasicAnimation  animationWithKeyPath:@"transform"];
//    animation.toValue = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
//    animation.duration =5.0;
//    [_mask addAnimation:animation forKey:@"animation"];
    self.mask.transform = CATransform3DMakeTranslation(0, 0, 0);
//    [UIView animateWithDuration:0 animations:^{
//        
//    } completion:nil];
    
}


@end
