//
//  SettingCellTableViewCell.h
//  SmallWeChat
//
//  Created by apple on 16/1/7.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTableViewCell.h"
#import "Setting.h"

@interface SettingCell : CommonTableViewCell

@property (nonatomic,strong) SettingItem *item;

+(CGFloat)getHeightForText:(SettingItem *)item;



@end
