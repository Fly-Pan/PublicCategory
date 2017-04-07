//
//  NotificionView.m
//  Tsp-a
//
//  Created by Taiyuan on 16/8/26.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import "NotificionView.h"
#import "MyTabBarController.h"
#import "MyNavController.h"
#import "ReserveDetailViewController.h"
#import "GGQRecordBean.h"
@interface NotificionView ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView * _bgView;
    UILabel * _waringLabel;
    GGQRecordBean * _model;
    NSMutableArray * _dataArray;
    UITableView * _tableView;
}
@end
@implementation NotificionView
singleton_implementation(NotificionView)

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:CGRectMake(0,70, mScreenWidth, 200)])
    {
        self.userInteractionEnabled = YES;
        _dataArray = [NSMutableArray array];
        
        _tableView = [[UITableView alloc] initWithFrame:ccr(0, 5, mScreenWidth, 200)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:_tableView];
        
    }
    return self;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellId = @"cell";
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = YES;
    UIView * bgView = [[UIView alloc]initWithFrame:ccr(-20, 0, mScreenWidth, 44)];
    bgView.layer.cornerRadius = 22;
    bgView.backgroundColor = mRGBToColor(0x0099cc);
    bgView.clipsToBounds = YES;
    [cell.contentView addSubview:bgView];
    
    UIButton * deleButton = [PFUIKit buttonWithFrame:ccr(bgView.width-44-20, 0, 44, 44) image:mImageByName(@"通知白色小叉叉") target:self acdaction:@selector(hiddenCell:)];
    deleButton.center = ccp(deleButton.centerX, bgView.height/2);
    deleButton.layer.cornerRadius = 22;
    [cell.contentView addSubview:deleButton];
    
    UIImage * image = mImageByName(@"通知小喇叭");
    UIImageView * waringImageView = [PFUIKit imageViewWithFilterFrame:ccr(20, 0, 44, 44) image:image];
    [bgView addSubview:waringImageView];
    
    UILabel * waringLabel = [PFUIKit labelWithFrame:ccr(waringImageView.right+10, 0, deleButton.x-waringImageView.right, 44) text:@"手机号不正确" font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] backGroundColor:[UIColor clearColor]];
    waringLabel.textAlignment = NSTextAlignmentLeft;
    waringLabel.numberOfLines = 0;
    [bgView addSubview:waringLabel];
    
    if (_dataArray.count==1) {
        bgView.frame =ccr(-20, 0, 0, 44);
        [UIView animateWithDuration:0.4 animations:^{
            bgView.frame = ccr(-20, 0, mScreenWidth, 44);
        } completion:^(BOOL finished) {
            
        }];

    }
    
    NSDictionary * dic = _dataArray[indexPath.row];
    NSString * string = dic[@"message"];
    waringLabel.text = string;

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic =_dataArray[indexPath.row];
    NSString * message = dic[@"message"];
    if ([dic[@"bean"] isKindOfClass:[GGQRecordBean class]]) {
        
        if (![message hasPrefix:@"您预留的"]) {
            return;
        }
        if ([[UserLoginInfo shareInstance].currentViewController isEqualToString:@"ReserveDetailViewController"]) {
            return ;
        }
        
        MyTabBarController * nav = (MyTabBarController *)[self getPresentedViewController];
        if (![[[UserLoginInfo shareInstance].viewController class] isKindOfClass:[ReserveDetailViewController class]]) {
            ReserveDetailViewController * detail = [[ReserveDetailViewController alloc]init];
            detail.model = _model;
            detail.type = FromMqtt;
            MyNavController * navit = [[MyNavController alloc]initWithRootViewController:detail];
            [nav presentViewController:navit animated:YES completion:nil];
        }

    }
}


-(void)hiddenCell:(UIButton *)button{
    UITableViewCell *cell = (UITableViewCell *)[button superview].superview;
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    
    NSLog(@"%@",indexPath);
    NSInteger rowInteger =indexPath.row;
    [self deleteCell:rowInteger];
    
    self.height = _dataArray.count*50;
}
-(void)deleteCell:(NSInteger)row{
    [_dataArray removeObjectAtIndex:row];

    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [indexPaths addObject:indexPath];
    
    [_tableView beginUpdates];
    [_tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    [_tableView endUpdates];
    
    if (_dataArray.count==0) {
        [self removeFromSuperview];
    }
}
-(void)hidden{
    
    [UIView animateWithDuration:0.4 animations:^{
        _bgView.frame =ccr(-20, 0, 0, 44);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}
-(void)detailView{
}

-(void)showWithMessage:(NSString *)message with:(GGQRecordBean *)bean{
    
    [(mAppDelegate).window addSubview:self];
    if (_dataArray.count ==3) {
        [self deleteCell:2];
    }
    if (bean) {
        _model = bean;
    }
    NSDictionary * dic =@{
                          @"time":[NSDate getNowDate],
                          @"bean":bean?bean:@"",
                          @"message":message
                          };
    [_dataArray insertObject:dic atIndex:0];
    self.height = _dataArray.count*50;
    [self addCell];
    [self performSelector:@selector(autoHidden) withObject:nil afterDelay:5];
}
-(void)addCell{
    [self insertCell:0];

}
-(void)autoHidden{
    if (_dataArray.count>0) {
        NSInteger coutn =_dataArray.count-1;
        for (NSInteger i= coutn; i>=0; i--) {
            NSDictionary * dic = _dataArray[i];
            NSString * saveTime = dic[@"time"];
            NSString * nowTime = [NSDate getNowDate];
            NSInteger div = [NSDate timeDiffFromBegin:saveTime End:nowTime];
            if (div>=5) {
                [self deleteCell:i];
            }else{
                [self performSelector:@selector(autoHidden) withObject:nil afterDelay:div];
            }
            NSLog(@"%ld",div);
        }
    }
    
}
-(void)insertCell:(NSInteger)row{
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [indexPaths addObject:indexPath];
    
    [_tableView beginUpdates];
    [_tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    [_tableView endUpdates];
}

-(void)setMqttRecrd:(GGQRecordBean *)record{
    _model = record;
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
- (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
