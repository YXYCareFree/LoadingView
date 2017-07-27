//
//  ViewController.m
//  LoadingView
//
//  Created by 杨肖宇 on 2017/7/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ViewController.h"
#import "YXYLoadingLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YXYLoadingLabel * loadingLabel = [[YXYLoadingLabel alloc] initWithFrame:CGRectMake(100, 100, 70, 70)];
    loadingLabel.lineColor = [UIColor blackColor];
    loadingLabel.text = @"loading";
    [self.view addSubview:loadingLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [loadingLabel stopAnimation];
//        [loadingLabel removeFromSuperview];
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [loadingLabel startAniamtion];
    });
}





@end
