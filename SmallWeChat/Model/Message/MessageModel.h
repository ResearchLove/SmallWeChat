//
//  MessageModel.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "UserModel.h"


/**
 *   消息拥有者
 **/

typedef NS_ENUM(NSUInteger,MessageOwnerType){
    
    MessageOwnerTypeUnKnown,   //未知的消息拥有者
    MessageOwnerTypeSystem,    //系统消息
    MessageOwnerTypeSelf,      //自己发送的消息
    MessageOwnerTypeOther,     //接收到他人的消息
    
};

/**
 *   消息类型
 **/

typedef NS_ENUM(NSInteger,MessageType){
    
    MessageTypeUnknow,        //未知
    MessageTypeSystem,        //系统
    MessageTypeText,          //文字
    MessageTypeImage,         //图片
    MessageTypeVoice,         //语音
    MessageTypeVideo,         //视频
    MessageTypeFile,          //文字
    MessageTypeLocation,      //位置
    MessageTypeShake,         //抖动

};

/**
     消息发送状态
 **/
typedef NS_ENUM(NSUInteger,MessageSendState){
    MessageSendStateSuccess,     //消息发送成功
    MessageSendStateFail,        //消息发送失败

};



/**
     消息读状态
 **/

typedef NS_ENUM(NSUInteger,MessageReadState){
    MessageReadStateUnRead,  //消息未读
    MessageReadStateReaded,  //消息已读
};


@interface MessageModel : NSObject

@property (nonatomic,strong) UserModel *fromUserModel;                   //发送者信息
@property (nonatomic,strong) NSDate *date;                               //发送时间
@property (nonatomic,strong) NSString *dateString;                       //格式化的发送时间
@property (nonatomic,assign) MessageType messageType;                    //消息类型
@property (nonatomic,assign) MessageOwnerType ownerType;                 //发送者类型
@property (nonatomic,assign) MessageReadState  readState;                //读取状态
@property (nonatomic,assign) MessageSendState  sendState;                //发送状态

@property (nonatomic,assign) CGSize messageSize;                         //消息大小
@property (nonatomic,assign) CGFloat cellHeight;                         //单元格高度
@property (nonatomic,strong) NSString *cellIdentify;                     //


#pragma mark - 文字消息
@property (nonatomic,strong) NSString *text;                             //文字消息
@property (nonatomic,strong) NSAttributedString *attrText;       //格式化文字消息


#pragma mark - 图片消息
@property (nonatomic,strong) NSString *imagePath;                        //本地图片路径
@property (nonatomic,strong) UIImage *image;                             //图片缓存
@property (nonatomic,strong) NSString *imageURL;                         //网络图片Url

#pragma mark - 位置消息
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;          //经纬度
@property (nonatomic,assign) NSString *address;                          //地址

#pragma mark - 语音消息
@property (nonatomic,assign) NSInteger voiceSeconds;                     //语音消息
@property (nonatomic,strong) NSString *coiceUrl;                         //网络语音Url
@property (nonatomic,strong) NSString *voicePath;                        //本地语音Path




@end
