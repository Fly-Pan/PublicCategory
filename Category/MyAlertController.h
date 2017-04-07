//
//  MyAlertController.h
//  DD_QService
//
//  Created by jsyuchi on 16/1/28.
//  Copyright © 2016年 jsyuchi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    AlertStyle,
    SheetStyle
}PreferredStyle;

@protocol MyAlertViewDelegate <NSObject>

-(void)alertViewAction:(BOOL)selected;

@end

@interface MyAlertController : NSObject<UIAlertViewDelegate>
@property (nonatomic,assign) id<MyAlertViewDelegate>delegate;

@property (nonatomic,assign) PreferredStyle style;

-(id)initWithTitle:(NSString *)title message:(NSString *)message view:(UIViewController *)view cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;

@end
