//
//  ChatMessageViewController.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@class ChatMessageViewController;

@protocol  ChatMessageViewControllerDelegate <NSObject>

-(void)didTapChatMessageView:(ChatMessageViewController *)chatMessageViewController;

@end

@interface ChatMessageViewController : UITableViewController

@property (nonatomic,assign) id<ChatMessageViewControllerDelegate>delegate;
@property (nonatomic,strong) NSMutableArray *data;

-(void)addNewMessage:(MessageModel *)message;
-(void)scrollToBottom;

@end
