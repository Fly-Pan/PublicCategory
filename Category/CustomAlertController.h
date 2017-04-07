//
//  CustomAlertController.h
//  Tsp-a
//
//  Created by xuehaodong on 2017/2/15.
//  Copyright © 2017年 Taiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomAlertControllerDelegate <NSObject>

- (void)selecteImage:(UIImage *)image ImageData:(NSData *)imageData ImageName:(NSString *)imageName;

@end

@interface CustomAlertController : NSObject <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,assign) id<CustomAlertControllerDelegate> delegate;

- (void)initAlertViewWithMessage1:(NSString *)message1 Message2:(NSString *)message2 Target:(UIViewController *)Target;

@end
