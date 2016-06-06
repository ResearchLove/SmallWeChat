//
//  UserModel.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,strong) NSString *userName;       //<<<用户名称
@property (nonatomic,strong) NSString *userId;         //<<<用户id
@property (nonatomic,strong) NSString *nikeName;       //<<<真实姓名
@property (nonatomic,strong) NSString *avatarURL;      //<<<头像路径
@property (nonatomic,strong) NSString *motto;          //<<<座右铭
@property (nonatomic,strong) NSString *phoneNumber;    //<<<手机号码

@property (nonatomic,strong) NSString *pinyin;
@property (nonatomic,strong) NSString *initial;

@end
