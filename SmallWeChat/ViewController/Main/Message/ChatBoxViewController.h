//
//  ChatBoxViewController.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@class ChatBoxViewController;
@protocol ChatBoxViewControllerDelegate <NSObject>

-(void)chatBoxViewController:(ChatBoxViewController *)chatBoxViewController didChangaeChatBoxHeight:(CGFloat)height;

-(void)chatBoxViewController:(ChatBoxViewController *)chatBoxViewController sendMessage:(MessageModel *)message;

@end

@interface ChatBoxViewController : UIViewController
@property id<ChatBoxViewControllerDelegate> delegate;

@end
