//
//  YXYLoadingLabel.h
//  LoadingView
//
//  Created by 杨肖宇 on 2017/7/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXYLoadingLabel : UILabel

@property (nonatomic, strong) UIColor * lineColor;//加载动画的颜色

- (void)startAniamtion;

- (void)stopAnimation;

@end
