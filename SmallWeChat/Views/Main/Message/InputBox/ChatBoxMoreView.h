//
//  ChatBoxMoreView.h
//  SmallWeChat
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatBoxMoreItem.h"

typedef NS_ENUM(NSInteger ,ChatBoxItem){
    
    ChatBoxItemAlbum = 0,
    ChatBoxItemCamera,
    
};

@class ChatBoxMoreView;
@protocol ChatBoxMoreViewDelegate <NSObject>

-(void)chatBoxMoreView:(ChatBoxMoreView *)chatBoxMoreView didSelectItem:(ChatBoxItem)itemType;

@end

@interface ChatBoxMoreView : UIView

@property (nonatomic,strong) id<ChatBoxMoreViewDelegate>delegate;
@property (nonatomic,strong) NSMutableArray *items;

@end
