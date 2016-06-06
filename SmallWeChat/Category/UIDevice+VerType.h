//
//  UIDevice+VerType.h
//  SmallWeChat
//
//  Created by apple on 15/12/24.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DeviceVerType) {
    DeviceVer4,
    DeviceVer5,
    DeviceVer6,
    DeviceVer6P,
    
};

@interface UIDevice (VerType)

+(DeviceVerType)deviceVerType;

@end
