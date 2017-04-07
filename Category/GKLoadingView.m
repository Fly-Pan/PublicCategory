//
//  GKLoadingView.m
//  AskMed
//
//  Created by GK on 15-1-27.
//  Copyright (c) 2015年 GK. All rights reserved.
//
#import "GKLoadingView.h"
#import "TWRProgressView.h"
#define kScale 0.4
@interface GKLoadingView ()
{
    TWRProgressView *_imageView;
    UIView *_indicatorView;
    UILabel *_indicatorLabel;
}
@end
@implementation GKLoadingView
singleton_implementation(GKLoadingView)

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if(self = [super initWithFrame:CGRectMake(0,0, mScreenWidth, mScreenHeight)])
    {
        self.backgroundColor = [UIColor clearColor];
        UIView * view= [[UIView alloc]initWithFrame:ccr(0, 0, mScreenWidth, mScreenHeight)];
        [self addSubview:view];
        //        view.backgroundColor = [UIColor orangeColor];
        self.userInteractionEnabled = YES;
        
        UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(15, 64+64, mScreenWidth-30,240)];
        [self addSubview:subView];

        
        _indicatorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, subView.width,subView.height)];
        _indicatorView.backgroundColor = mRGBToColor(0x0099cc);
        _indicatorView.alpha = 0.8;
        _indicatorView.layer.cornerRadius = 4;
        [subView addSubview:_indicatorView];
        
        UILabel * label = [PFUIKit labelWithFrame:ccr(0, 30, 100, 20) text:@"请稍等" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] backGroundColor:[UIColor clearColor]];
        label.center = ccp(_indicatorView.width/2, label.centerY);
        [subView addSubview:label];
        
        _indicatorLabel = [PFUIKit labelWithFrame:ccr(0, _indicatorView.height-20-30, _indicatorView.width, 20) text:@"正在加载停车数据" font:[UIFont systemFontOfSize:16] textColor:[UIColor whiteColor] backGroundColor:[UIColor clearColor]];
        [subView addSubview:_indicatorLabel];
        
        UIImage * image = mImageByName(@"等待图标灰");
        _imageView = [TWRProgressView progressViewWithFrame:ccr(0, label.bottom+15, image.size.width, image.size.height) andMaskingImage:image];
        _imageView.center = ccp(subView.width/2, label.bottom+(_indicatorLabel.y-label.bottom)/2);
        [subView addSubview:_imageView];

    }
    return self;
}

-(void)show
{
    [(mAppDelegate).window addSubview:self];
    [_imageView setProgress:1 animated:YES];

//    (mAppDelegate).window.userInteractionEnabled = YES;
//    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//    rotationAnimation.duration = 1.0;
//    rotationAnimation.cumulative = YES;
//    rotationAnimation.repeatCount = MAXFLOAT;
//    [rotationAnimation setFillMode:kCAFillModeForwards];
//    [rotationAnimation setRemovedOnCompletion:NO];
//    [_imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)show:(NSString *)message
{
    _indicatorLabel.text = message;
    [self show];
}

-(void)hidden
{
//    _indicatorLabel.text = @"玩命加载中...";
    [_imageView setProgress:1 animated:NO];
    [self removeFromSuperview];
}
@end
