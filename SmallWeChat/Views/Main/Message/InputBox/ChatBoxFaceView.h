//
//  ChatBoxFaceView.h
//  SmallWeChat
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceModel.h"

@protocol  ChatBoxFaceViewDelegate <NSObject>

-(void)chatBoxFaceViewDidSelectedFace:(FaceModel *)face type:(FaceType)type;
- (void) chatBoxFaceViewDeleteButtonDown;
- (void) chatBoxFaceViewSendButtonDown;

@end

@interface ChatBoxFaceView : UIView

@property (nonatomic,assign) id <ChatBoxFaceViewDelegate>delegate;

@end
