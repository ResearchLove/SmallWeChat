//
//  MineViewController.h
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"

@class UserModel;

@interface MineViewController : SettingViewController

@property (nonatomic,strong) UserModel *userModel;

@end
