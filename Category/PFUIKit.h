//
//  PFUIKit.h
//  HNGant-HaoLan
//
//  Created by jsyuchi on 15/6/29.
//  Copyright (c) 2015年 jsyuci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFUIKit : NSObject

+(UIImageView *)imageViewWithFilterFrame:(CGRect)frame image:(UIImage *)image;


+(UIButton *)buttonWithFilterFrame:(CGRect)frame text:(NSString *)title target:(id)target acdaction:(SEL)action;


+(UIButton *)buttonWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target acdaction:(SEL)action;
+(UIButton *)buttonShadowWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target acdaction:(SEL)action;

+(UIButton *)buttonWithFrame:(CGRect)frame text:(NSString *)text backgroundColor:(UIColor *)color textColor:(UIColor *)textColor target:(id)target acdaction:(SEL)action;

+(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont*)font textColor:(UIColor *)color backGroundColor:(UIColor *)bColor;

+(UILabel *)labelLineWithFrame:(CGRect)frame;

//Menu button
+(UIButton *)buttonWithFrame:(CGRect)frame titlt:(NSString *)title image:(UIImage *)image target:(id)target acdaction:(SEL)action;
+(UIButton *)buttonWithFrame:(CGRect)frame titlt:(NSString *)title bColor:(UIColor *)bColor target:(id)target acdaction:(SEL)action;
+(UIButton *)buttonWithFrame:(CGRect)frame titlt:(NSString *)title image:(UIImage *)image bColor:(UIColor*)bColor tag:(NSInteger)tag target:(id)target acdaction:(SEL)action;

+(UITextField *)textFiledWithFrame:(CGRect)frame placeholder:(NSString *)placeholder;

+(UIButton*)buttonWithFrame:(CGRect)frame title:(NSString*)title tColors:(NSArray*)tColors images:(NSArray*)images tag:(NSInteger)tag target:(id)target action:(SEL)action;

@end
