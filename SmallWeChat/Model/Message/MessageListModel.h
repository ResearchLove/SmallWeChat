//
//  ConversationModel.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageListModel : NSObject

@property (nonatomic,strong) NSString  *fromName;       //发送者
@property (nonatomic,strong) NSDate *date;              //时间
@property (nonatomic,strong) NSString *messageCon;         //消息
@property (nonatomic,assign) NSInteger messageCount;    //消息条数
@property (nonatomic,strong) NSURL *avatarURL;          //头像路径

@end
