//
//  CustomAlertController.m
//  Tsp-a
//
//  Created by xuehaodong on 2017/2/15.
//  Copyright © 2017年 Taiyuan. All rights reserved.
//

#import "CustomAlertController.h"
#import "PersonViewController.h"

@implementation CustomAlertController

- (void)initAlertViewWithMessage1:(NSString *)message1 Message2:(NSString *)message2 Target:(UIViewController *)target{
    
    UIAlertController *sheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions.
    UIAlertAction *openCameraAction = [UIAlertAction actionWithTitle:message1 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.delegate = (PersonViewController *)target;
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        picker.allowsEditing = YES;
        [target presentViewController:picker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *openAlbumAction = [UIAlertAction actionWithTitle:message2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = (PersonViewController *)target;
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        [target presentViewController:picker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    
    // Add the actions.
    [sheetController addAction:openCameraAction];
    [sheetController addAction:openAlbumAction];
    [sheetController addAction:cancelAction];
    
    [target presentViewController:sheetController animated:YES completion:nil];
}

#if 0
#pragma mark - 选择图片 -
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image =  [info objectForKey:UIImagePickerControllerEditedImage];
    UIImageOrientation imageOrientation=image.imageOrientation;
    if(imageOrientation!=UIImageOrientationUp)
    {
        // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
        // 以下为调整图片角度的部分
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        // 调整图片角度完毕
    }
    
    NSData * mageDate = UIImageJPEGRepresentation(image, 0.000001);
    UIImage * newImage= [[UIImage alloc]initWithData:mageDate];
    NSData * imageDate = UIImagePNGRepresentation(newImage);
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[date timeIntervalSince1970]*1000;
    NSString *timeStr = [NSString stringWithFormat:@"%ld%@",(NSInteger)now,@".png"];
    
    if ([self respondsToSelector:@selector(selecteImage:ImageData:ImageName:)]) {
        [self.delegate selecteImage:image ImageData:imageDate ImageName:timeStr];
    }

    //处理完毕，回到个人信息页面
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//取消选取图片
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#endif

@end
