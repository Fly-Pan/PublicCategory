//
//  WaringView.m
//  Tsp-a
//
//  Created by Taiyuan on 16/8/18.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import "WaringView.h"
@interface WaringView ()
{
    UIView * _bgView;
    UILabel * _waringLabel;
}
@end
@implementation WaringView
singleton_implementation(WaringView)

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:CGRectMake(0,mScreenHeight-44-15, mScreenWidth, 44)])
    {
        _bgView = [[UIView alloc]initWithFrame:ccr(-20, 0, mScreenWidth, 44)];
        _bgView.layer.cornerRadius = 22;
        _bgView.backgroundColor = mRGBToColor(0xff3b30);
        _bgView.clipsToBounds = YES;
        [self addSubview:_bgView];
        
        UIButton * button = [PFUIKit buttonWithFrame:ccr(_bgView.width-44, 0, 44, 44) image:mImageByName(@"通知白色小叉叉") target:self acdaction:@selector(hidden)];
        button.center = ccp(button.centerX, _bgView.height/2);
        button.layer.cornerRadius = 22;
        [_bgView addSubview:button];
        
        UIImage * image = mImageByName(@"通知小三角");
        UIImageView * waringImageView = [PFUIKit imageViewWithFilterFrame:ccr(20, 0, 44, 44) image:image];
        [_bgView addSubview:waringImageView];
        
        _waringLabel = [PFUIKit labelWithFrame:ccr(waringImageView.right+10, 0, button.x-waringImageView.right, 44) text:@"手机号不正确" font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backGroundColor:[UIColor clearColor]];
        _waringLabel.textAlignment = NSTextAlignmentLeft;
        [_bgView addSubview:_waringLabel];
    }
    return self;
}
-(void)hidden{
    
    [UIView animateWithDuration:0.4 animations:^{
        _bgView.frame =ccr(-20, 0, 0, 44);

    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];

}


-(void)showWithMessage:(NSString *)message{
    [(mAppDelegate).window addSubview:self];
    _waringLabel.text = message;
    _bgView.frame = ccr(-20, 0, 0, 44);
    [UIView animateWithDuration:.4 animations:^{
        _bgView.frame =ccr(-20, 0, mScreenWidth, 44);
    }];
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(hidden) withObject:nil afterDelay:3.0f];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
