//
//  ChatBox.h
//  SmallWeChat
//
//  Created by apple on 15/12/24.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceModel.h"
/*
 聊天栏状态
 */
typedef  NS_ENUM(NSInteger,ChatBoxStatus){
    ChatBoxStatusNothing,
    ChatBoxStatusShowVoice,
    ChatBoxStatusShowFace,
    ChatBoxStatusShowMore,
    ChatBoxStatusShowKeyboard,
};
@class ChatBox;
@protocol ChatBoxDelegate <NSObject>

-(void)chatBox:(ChatBox *)chatBox changeStatusForm:(ChatBoxStatus)fromStatus to:(ChatBoxStatus)toStatus;

-(void)chatBox:(ChatBox *)chatBox sendTextMessage:(NSString *)textMessage;
/*
 改变聊天栏的高
 */
-(void)chatBox:(ChatBox *)chatBox changeChatBoxHeight:(CGFloat)height;

@end

@interface ChatBox : UIView
@property (nonatomic,assign) id<ChatBoxDelegate>delegate;
@property (nonatomic,assign) ChatBoxStatus status;
@property (nonatomic, assign) CGFloat curHeight;

-(void)addEmojiFace:(FaceModel *)face;
-(void)sendCurrentMessage;
-(void)deleteButtonDown;

@end
