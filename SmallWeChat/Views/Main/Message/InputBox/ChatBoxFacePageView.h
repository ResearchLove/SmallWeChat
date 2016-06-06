//
//  ChatBoxFacePageView.h
//  SmallWeChat
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceModel.h"

@interface ChatBoxFacePageView : UIView

@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,assign) UIControlEvents controlEvents;

- (void) showFaceGroup:(FaceGroupModel *)group formIndex:(int)fromIndex count:(int)count;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
