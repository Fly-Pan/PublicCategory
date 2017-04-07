//
//  AppConstants.h
//  CardMaster
//
//  Created by Lyner on 13-7-9.
//  Copyright (c) 2013年 GL. All rights reserved.
//
 
#import <Foundation/Foundation.h>

#define Session_Key @""


/************************************* 测试环境 ********************************************/
#define MQTT_IP @"testmqtt.typark.net"
#define MQTT_Port 61613
#define PIC_URL @"http://testapi.typark.com.cn"
#define BASE_URL @"http://testapi.typark.com.cn"
/******************************************************************************************/



/************************************* 上线环境 ********************************************/
//#define MQTT_IP @"mqtt.typark.net"
//#define MQTT_Port 61613
//#define PIC_URL @"http://m.typark.net"
//#define BASE_URL @"http://api.typark.net"
/******************************************************************************************/



/************************************* 仿真环境 ********************************************/
//#define MQTT_IP @"simmqtt.typark.net"
//#define MQTT_Port 61613
//#define PIC_URL @"http://simm.typark.com.cn"
//#define BASE_URL @"http://simapi.typark.com.cn"
/******************************************************************************************/


#define Nearby_Parking  @"/api/app/park/qParkingArea"                //搜索停车场
#define Parking_Detail  @"/api/app/park/fParkingSeat"                //停车场详情
#define Parking_SState  @"/api/app/park/fParkSeatState"    
//停车位状态
#define Parking_ReserveById  @"/api/app/record/reserveById"      //查看停车位是否为当前账户预留车位

#define Parking_STime  @"/api/app/record/fReserveTime"               //停车位可预约时间
#define Parking_SPrice  @"/api/app/park/fReserveCost2"                //预约费用
#define Parking_Check  @"/api/app/park/checkSeat"                //检测停车位状态费用
#define Charging_Str    @"/api/app/park/fChargingStrategy"           //收费策略
#define Content_Url    @"/api/app/content/qContents"           //Content
#define Content_Html  @"/app/content/fContentHtmlById.do?id="                //获取详情
#define Key_Words       @"/api/app/park/qKeyWords"                //获取关键字搜索

#define Svg_DownLoad    @"/api/app/version/downFile"                 //SVG下载
#define Bill_BestCark   @"/api/app/card/fBestCard"                 //推荐卡片优惠
#define WX_Pay          @"/api/app/record/weixinPayUnifiedorder"       //微信支付
#define Resevel_Bill    @"/api/app/record/cmtReserveTran"              //发送订单信息
#define Cancle_Bill    @"/api/app/record/cmtCancelReserveTran"         //取消订单
#define Pay_NotifyURL      @"/api/app/record/fAlipayResult"                 //支付宝订单回掉


#define Loging_Net      @"/api/app/customer/token"              //快速登录
#define LOginOut_Net    @"/api/app/customer/loginOut"              //退出登录
#define Parking_Info    @"/api/app/fParkingSeat"                //停车场信息
#define Parking_Recorde @"/api/app/record/qRecord"                     //交易信息

#define Renew_Token     @"/api/app/customer/renewToken"         //更新token
#define Send_SC         @"/api/app/customer/sendSC"             //发送验证码
#define Check_Park      @"/api/app/checkPark"                   //检测车位停车场
#define Lock_Open       @"/api/app/record/cmtTakeCarTran"                                             //激活解锁车位、打开车位
#define Lock_Open_Pay   @"/api/app/record/recordByCode"                 //取车获取支付订单
#define Lock_Open_CmtPayTran  @"/api/app/record/cmtPayTran"            //取车接口

#define Get_LockSys     @"/api/app/getLockSymbol"               //获取地锁编号
#define Get_CardRecords @"/api/app/card/qCardRecords"           //获取缴费记录
#define Get_QContents   @"/api/app/content/qContents"           //获取广告、发现等
#define Get_Cards   @"/api/app/card/qCards"                      //卡券记录
#define Get_BestCards   @"/api/app/card/fBestCard"                   //最优卡券
#define Get_qCardRecords @"/api/app/card/qCardRecords"         //月卡续费记录
#define Change_NickName   @"/api/app/customer/cmtNickName"       //设置昵称
#define Change_CustomerPhoto   @"/api/app/customer/cmtUserPhoto"  //设置头像
#define Pay_CmtRenewCard   @"/api/app/card/cmtRenewCard"        //包月卡续费
#define Get_FReCord   @"/api/app/record/fRecord"              //获取交易记录
#define Cancel_Reserve  @"/api/app/record/cmtCancelReserveTran"      //取消预留
#define Parking_CmtPaymentTran  @"/api/app/record/cmtPaymentTran"      //支付未支付订单

#define Check_UploadVersion @"/api/app/version/uploadVersion"//检查更新版本


#define HTTP_CONECT(x,y) [NSString stringWithFormat:@"%@%@",x,y]

#define  KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"
#define  KEY_USERNAME @"com.company.app.username"
#define  KEY_PASSWORD @"com.company.app.password"
