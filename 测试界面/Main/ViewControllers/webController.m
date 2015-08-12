//
//  webController.m
//  测试界面
//
//  Created by shoule on 15/7/16.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "webController.h"

@interface webController () //<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation webController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *URL = [[NSURL alloc]initWithString:@"http://testmjz.bestcake.com/android"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:URL];
    [self.webView loadRequest:request];
//    UIViewController *VC = [self.webView viewController];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestString = [[request URL] absoluteString];
    NSLog(@"%@",requestString);
    //判断是否是单击
//    if (navigationType == UIWebViewNavigationTypeLinkClicked)
//    {
//        NSURL *url = [request URL];
//        
//        if([[UIApplication sharedApplication]canOpenURL:url])
//        {
//            [[UIApplication sharedApplication]openURL:url];
//        }
//        return NO;
//    }
    if ([requestString isEqualToString:@"http://testmjz.bestcake.com/test"]) {
        return NO;
    }
    return YES;
}



@end
