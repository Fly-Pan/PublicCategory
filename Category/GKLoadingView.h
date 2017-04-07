//
//  GKLoadingView.h
//  AskMed
//
//  Created by GK on 15-1-27.
//  Copyright (c) 2015年 GK. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface GKLoadingView : UIView
singleton_interface(GKLoadingView)

-(void)show;
-(void)show:(NSString *)message;

-(void)hidden;
@end
