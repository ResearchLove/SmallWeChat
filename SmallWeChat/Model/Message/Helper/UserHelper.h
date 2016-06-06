//
//  UserHelper.h
//  SmallWeChat
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserHelper : NSObject

@property (nonatomic,strong) UserModel *userModel;

+(UserHelper *)sharedUserHelper;


@end
