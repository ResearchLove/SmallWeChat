//
//  SettingHeaderFooteFView.h
//  SmallWeChat
//
//  Created by apple on 16/1/7.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingHeaderFooteFView : UITableViewHeaderFooterView

@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) UILabel *titleLabel;

+ (CGFloat)getHeightForText:(NSString *)text;

@end
