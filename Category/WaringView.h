//
//  WaringView.h
//  Tsp-a
//
//  Created by Taiyuan on 16/8/18.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WaringView : UIView
singleton_interface(WaringView)

-(void)showWithMessage:(NSString *)message;

@end
