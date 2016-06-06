//
//  DataHelper.h
//  SmallWeChat
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataHelper : NSObject

/**
 *  格式化好友列表
 */
+ (NSMutableArray *) getFriendListDataBy:(NSMutableArray *)array;
+ (NSMutableArray *) getFriendListSectionBy:(NSMutableArray *)array;

@end
