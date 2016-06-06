//
//  UIHelper.h
//  SmallWeChat
//
//  Created by apple on 16/1/10.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Setting.h"

@interface UIHelper : NSObject

+ (SettingGrounp *) getFriensListItemGroup;
+ (NSMutableArray *)getDiscoverItems;
+ (NSMutableArray *)getMineVCItems;
+ (NSMutableArray *)getDetailVCItems;
+ (NSMutableArray *)getDetailSettingVCItems;
+ (NSMutableArray *)getMineDetailVCItems;

+(NSMutableArray *)getSettingVCItems;
+(NSMutableArray *)getNewNotiVCItems;  



@end
