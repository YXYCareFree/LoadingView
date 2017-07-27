//
//  YXYLoadingLabel.m
//  LoadingView
//
//  Created by 杨肖宇 on 2017/7/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "YXYLoadingLabel.h"


@implementation YXYLoadingLabel{
    CAShapeLayer * _shapeLayer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    self.textAlignment = NSTextAlignmentCenter;
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.layer addSublayer:_shapeLayer];
    
    [self createAnimation];
}

- (void)createAnimation{
    
    CAKeyframeAnimation * rorateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rorateAnimation.removedOnCompletion = NO;
    rorateAnimation.values = @[@0, @M_PI, @(2 * M_PI)];
    rorateAnimation.keyTimes = @[@0.0f, @0.5f, @1.0f];
    rorateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rorateAnimation.duration = 0.75;
    rorateAnimation.repeatCount = HUGE_VALF;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.height / 2, self.frame.size.height / 2) radius:self.frame.size.height / 2 startAngle:0.7 * M_PI endAngle:1.2 * M_PI clockwise:NO];
    _shapeLayer.path = path.CGPath;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = self.lineColor.CGColor;
    _shapeLayer.lineWidth = 2;
    
    [_shapeLayer addAnimation:rorateAnimation forKey:nil];
}

- (void)setLineColor:(UIColor *)lineColor{
    _shapeLayer.strokeColor = lineColor.CGColor;
    _lineColor = lineColor;
}

- (void)startAniamtion{
    [self createAnimation];
}

- (void)stopAnimation{
    [_shapeLayer removeAllAnimations];
}

@end
