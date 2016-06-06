//
//  UIDevice+VerType.m
//  SmallWeChat
//
//  Created by apple on 15/12/24.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "UIDevice+VerType.h"

@implementation UIDevice (VerType)

+(DeviceVerType)deviceVerType
{
    if (WIDTH_SCREEN == 375) {
        return DeviceVer6;
    }else if(WIDTH_SCREEN == 414){
        return DeviceVer6P;
    }else if(WIDTH_SCREEN == 480){
        return DeviceVer4;
    }else if(WIDTH_SCREEN == 568){
        return DeviceVer5;
    }
    return DeviceVer4;
}

@end
