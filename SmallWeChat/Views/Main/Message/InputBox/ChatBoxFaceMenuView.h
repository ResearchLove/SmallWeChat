//
//  ChatBoxFaceMenuView.h
//  SmallWeChat
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceModel.h"


@class ChatBoxFaceMenuView;
@protocol ChatBoxFaceMenuViewDelegate <NSObject>

-(void)chatBoxFaceMenuViewAddButtonDown;

-(void)chatBoxFaceMenuViewSendButtonDown;

- (void) chatBoxFaceMenuView:(ChatBoxFaceMenuView *)chatBoxFaceMenuView didSelectedFaceMenuIndex:(NSInteger)index;

@end

@interface ChatBoxFaceMenuView : UIView

@property (nonatomic,assign) id<ChatBoxFaceMenuViewDelegate>delegate;
@property (nonatomic,strong) NSMutableArray *faceGroupArray;

@end
