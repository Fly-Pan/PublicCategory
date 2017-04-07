//
//  NotificionView.h
//  Tsp-a
//
//  Created by Taiyuan on 16/8/26.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificionView : UIView
singleton_interface(NotificionView)

-(void)showWithMessage:(NSString *)message with:(GGQRecordBean *)bean;
-(void)setMqttRecrd:(GGQRecordBean *)record;
-(void)hidden;

@end
