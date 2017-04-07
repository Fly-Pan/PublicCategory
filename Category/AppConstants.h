//
//  AppConstants.h
//  CardMaster
//
//  Created by Lyner on 13-7-9.
//  Copyright (c) 2013年 GL. All rights reserved.
//
 
#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)(BOOL netConnect);
typedef void (^NetWorkBlock)(BOOL netConnect);
typedef void (^ProgressBlock)(CGFloat returnProgress);


#define k_MapId @"pqpGoG66vsK2DkTBbeTOBfoot709Imp2"
#define k_WeChat_AppID @"wxf2cbc8b880a2012b"
#define k_WeChat_AppSecret @"a8fafff34c60153ad9de3a22f5b17a9c"
/**
 *   支付宝
 */
#define k_Parnter @"2088911678955478"
#define k_Seller @"njqywhcm@126.com"
#define k_Key @"lew3slubsbhvf09cpngs0n42fk1suyes"
#define k_Ali_AppId @"2016042801344043"
#define k_Private_Key @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAKlJ9tcQRoHH3Y2faFSMt/GLaA2uoEegAjQ1XdKgAm42gBajH4FOvzTe4PuuW8nBr1D8bZ/JlvICNVFKsomzbG6Mu+fWazKTXtznZIIDf0HCy5rhcdWr+59sVDZ9+fitiSB6tqJQh5iGXgMorB+karN6MlFGkpddRWJ2Uc32WW6/AgMBAAECgYBjKQQBbXMfSecosZr3C4YjYjkM6qDP05X25tuSKE/EJwBYQiyOHYY6feLjCXqSb3U1xuaflgFouIpql4qExihYlNpQDG4L/pksgeuortFxShfjId1ru8ejIJMpLhOywzwizpapr3y/f+hMNkG4BMjvRngxwVmk/rVPFIbaSGZFgQJBANi/YIBD44GFFOPWOBglEc13cb5e2Ri/Rfcq33XdCtsR6rNSOYLm8Z4+hSI6mHH6ySOGGyreweJkTPEjp/Xq9c8CQQDH8lwGU/XB7LMo+s/dXERrz684dr2PjwybBlSmPI9YrMlafrxclt53ZVOfHkl0UWzqq02LlNk9I05hDKcPciQRAkBUlvPpexVKEg8iEBOaULVO8+O/QTMG9ncuzFujmx3Ge4qWa2uoi8sWUB4TSrz+FrrzEz59D6ypVy20Go9NaWJ/AkEAuISw6CYTZiNKM0dDDMVZXyUKTtFFnnYk6+ursr2wi+To7NqIeenA4+5efTk2EGIUYXw009tJn2I1sto6UcbEAQJBAMcujxwDlpGlSLmPinp+hjxPwE+OLpEcSoxFrq90NQh6nc8QRMyuuWsSJ12N4D/DkbnXpXzP+4mynIjnnMXgHYA="
/**
 *   颜色定义
 */
// tableview  cell 的底色
#define kCellBgColor  0xE6E0D4
// tableview cell 文字颜色
#define kCellTextColor 0x7D7A69

// 数据库文件名称
#define kDefaultDBName  @"Telesing'sParking.db"

// 检索历史的 检索来源类型,  CODE  , KEYWORD
#define kSearchType_Scan @"SCAN"
#define kSearchType_Keyword @"KEYWORD"



#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 常用的宏定义
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
    CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)

#define WIN_SIZE [UIScreen mainScreen].bounds.size
#define WIN_WIDTH [UIScreen mainScreen].bounds.size.width
#define WIN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IS_IPHONE6_LATER ((WIN_WIDTH >= 375 && WIN_HEIGHT >= 667) == YES ? YES:NO)
#define IS_IPHONE5_LATER ((WIN_WIDTH <=320 && WIN_HEIGHT < 568) == YES ? YES:NO)
#define NAV_BAR_BACK_IMG @"banner"

// 把16进制的颜色转成UIColor对象 
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - HTTP请求定义区


// 与服务器连接超时设定
#define WSURL_TIMEOUT 60

// Frame的快捷操作
static inline CGFloat GG_X(UIView *view){ return view.frame.origin.x;}
static inline CGFloat GG_Y(UIView *view){ return view.frame.origin.y;}
static inline CGFloat GG_W(UIView *view){ return view.frame.size.width;}
static inline CGFloat GG_H(UIView *view){ return view.frame.size.height;}
static inline CGFloat GG_BOTTOM_Y(UIView *view){ return GG_Y(view) + GG_H(view);};
static inline CGFloat GG_RIGHT_X(UIView *view){ return GG_X(view) + GG_W(view);};


//图片加载打开还是关闭
#define ISDFNetReachableViaClose @"ISDFNetReachableViaClose"


// 快捷方式
#define ccp(x,y) CGPointMake(x, y)
#define ccs(x,y) CGSizeMake(x, y)
#define ccr(x,y,w,h) CGRectMake(x,y,w,h)

#define BASE_WIDTH  750.0
#define BASE_HEIGHT 1334.0

#define RELATIVE_WIDTH(w) WIN_WIDTH/BASE_WIDTH * w

#define SSKeyChain_Login @"SSKeyChain_com.jsyuci.HaoLan"
#define SSKeyChain_Account @"SSKeyChain_username"
#define SSKeyChain_Password @"SSKeyChain_password"
// 密码加密password
#define SSKeyChain_Password_Key @"Passw0rd"

//通知更改app背景图片
#define Notification_App_Amend_Background @"Notification_App_Amend_Background"

#define IconButton_Corner 50
#define IconImageView_Corner 40
#define UserImageView_Corner 30
#define ParkInfoIconImageView_Corner 22

#define TITLE_MONTHCARD @"我的包月卡"

#define Counting @"计算中..."
#define Nomal_PriceState @"正常"

#define Parking_Seat_Normal @"预留"
#define Parking_Seat_Occupy @"此车位已被占用"
#define Parking_Seat_Resevel @"此车位已被预留"
#define Parking_Seat_NoUse @"此车位故障，无法使用！"

#define Parking_Seat_NoTime @"此时间段无法预留"

#define Parking_AliPay_Resevel @"领泊车位预留收费"
#define Parking_AliPay_Parking @"领泊车位停车收费"

#define Parking_Resevel_Limt_Time @"该订单已超时，请重新预留"
#define Parking_OpenCar_Limt_Time @"该订单已超时，请重新输入车位号"

#define UnZip_Filed @"图纸打开失败，程序猿正在努力中..."
#define UnZip_NoFind @"没有上传停车场图纸,请稍后"


#define Parking_NoRecive_MQTT @"请到个人中心查看结果，如需帮助，请联系客服."
#define Parking_NoRecive_OpenCar @"请到个人中心查看结果，如需帮助，请联系客服"
