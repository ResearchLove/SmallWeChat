//
//  ChatBoxMoreItem.h
//  SmallWeChat
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatBoxMoreItem : UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *imageName;

+(ChatBoxMoreItem *)createChatBoxMoreItemWithTitle:(NSString *)title imageName:(NSString *)imageName;

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
