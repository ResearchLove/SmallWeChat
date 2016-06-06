//
//  FaceHelper.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FaceModel.h"


//表情助手
@interface FaceHelper : NSObject

@property (nonatomic,strong) NSMutableArray *faceGroupArray;

+(FaceHelper *)sharedFaceHelper;

- (NSArray *) getFaceArrayByGroupID:(NSString *)groupID;

@end
