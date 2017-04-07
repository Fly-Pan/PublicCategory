//
//  PFUIKit.m
//  HNGant-HaoLan
//
//  Created by jsyuchi on 15/6/29.
//  Copyright (c) 2015年 jsyuci. All rights reserved.
//

#import "PFUIKit.h"
#import "MenuButton.h"
@implementation PFUIKit
+(UIImageView *)imageViewWithFilterFrame:(CGRect)frame image:(UIImage *)image{
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = frame;
    return imageView;
}

+(UIButton *)buttonWithFilterFrame:(CGRect)frame text:(NSString *)title target:(id)target acdaction:(SEL)action{
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    button.layer.cornerRadius =frame.size.height/2;
    [button setBackgroundColor:mRGBToColor(0xb2b2b2)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


+(UIButton *)buttonWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target acdaction:(SEL)action{
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+(UIButton *)buttonShadowWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target acdaction:(SEL)action{
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    button.layer.shadowOpacity = 1;
    button.layer.shadowOffset = ccs(0, 0);
    button.layer.shadowColor = mRGBToColor(0x999999).CGColor;
    button.layer.shadowRadius = 1;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


+(UIButton *)buttonWithFrame:(CGRect)frame text:(NSString *)title backgroundColor:(UIColor *)color textColor:(UIColor *)textColor target:(id)target acdaction:(SEL)action{
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    button.layer.cornerRadius = 5;
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;

}
+(UILabel *)labelLineWithFrame:(CGRect)frame{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor = mRGBToColor(0xd2d2d2);
    return label;

}

+(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color backGroundColor:(UIColor *)bColor{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor= color;
    label.backgroundColor = bColor;
    return label;
}

+(UIButton *)buttonWithFrame:(CGRect)frame titlt:(NSString *)title image:(UIImage *)image target:(id)target acdaction:(SEL)action{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];;
    button.frame = frame;
//    button.layer.cornerRadius = frame.size.height/2;
//    button.layer.borderWidth = 1;
//    button.layer.borderColor = mRGBToColor(0xd86ca9).CGColor;
//    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10];
//    button.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;

}

+(UIButton *)buttonWithFrame:(CGRect)frame titlt:(NSString *)title bColor:(UIColor *)bColor target:(id)target acdaction:(SEL)action{
    UIButton * button = [[UIButton alloc]init];;
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:bColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}

+(UITextField *)textFiledWithFrame:(CGRect)frame placeholder:(NSString *)placeholder{
    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:14];
    textField.borderStyle = UITextBorderStyleNone;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    return textField;
}

+(UIButton *)buttonWithFrame:(CGRect)frame titlt:(NSString *)title image:(UIImage *)image bColor:(UIColor*)bColor tag:(NSInteger)tag target:(id)target acdaction:(SEL)action
{
    MenuButton * button = [[MenuButton alloc]init];;
    [button setFrame:frame];
    [button setTag:tag];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:bColor];
    [button setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGB(0xededed) forState:UIControlStateHighlighted];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton*)buttonWithFrame:(CGRect)frame title:(NSString*)title tColors:(NSArray*)tColors images:(NSArray*)images tag:(NSInteger)tag target:(id)target action:(SEL)action
{
    if ([images count] != 2 || [tColors count] != 2 ) {
        return nil;
    }
    MenuButton * button = [[MenuButton alloc]init];
    [button setTag:tag];
    [button setFrame:frame];
    [button setImage:[UIImage imageNamed:[images firstObject]] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[images lastObject]] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[tColors firstObject] forState:UIControlStateNormal];
    [button setTitleColor:[tColors lastObject] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
