//
//  UserHelper.m
//  SmallWeChat
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "UserHelper.h"

static UserHelper *userHelper = nil;

@implementation UserHelper

+(UserHelper *)sharedUserHelper
{
    if (userHelper == nil) {
        userHelper = [[UserHelper alloc]init];
    }
    return userHelper;
}


-(UserModel *)userModel
{
    if(_userModel == nil){
        _userModel = [[UserModel alloc]init];
        _userModel.userName = @"Bay、栢";
        _userModel.userId = @"li-bokun";
        _userModel.avatarURL = @"0.jpg";
    }
    return _userModel;
}

@end
