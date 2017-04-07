//
//  MyAlertController.m
//  DD_QService
//
//  Created by jsyuchi on 16/1/28.
//  Copyright © 2016年 jsyuchi. All rights reserved.
//

#import "MyAlertController.h"

@implementation MyAlertController

-(id)initWithTitle:(NSString *)title message:(NSString *)message view:(UIViewController *)view cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles{
    self = [super init];
    if (self) {
        if (IOS8_OR_LATER) {
//            NSString *title = title;
//            NSString *message =message;
//            NSString *cancelButtonTitle = NSLocalizedString(@"Alert_sure", nil);
//            NSString *otherButtonTitle = NSLocalizedString(@"Alert_no", nil);
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
                
                // Create the actions.
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    [self.delegate alertViewAction:YES];
                }];
                
                UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    [self.delegate alertViewAction:NO];
                }];
                
                // Add the actions.
                [alertController addAction:cancelAction];
                [alertController addAction:otherAction];
                
                [view presentViewController:alertController animated:YES completion:nil];
        }
        else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:title message:message  delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
            [alert show];
        }
        
    }
    return self;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        if ([_delegate respondsToSelector:@selector(alertViewAction:)]) {
            [self.delegate alertViewAction:YES];
        }
    }else{
        if ([_delegate respondsToSelector:@selector(alertViewAction:)]) {
            [self.delegate alertViewAction:NO];
        }

    }
}
@end
