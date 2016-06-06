//
//  UserModel.m
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "UserModel.h"
#import "NSString+PinYin.h"

@implementation UserModel
-(void)setUserName:(NSString *)userName
{
    _userName = userName;
    _pinyin = userName.pinyin;
    _pinyin = userName.pinyinInitial;
}

@end
