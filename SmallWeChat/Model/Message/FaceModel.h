//
//  FaceModel.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, FaceType) {
    FaceTypeEmoji,
    FaceTypeGIF,
};

//表情模型
@interface FaceModel : NSObject

@property (nonatomic,strong) NSString *faceId;
@property (nonatomic,strong) NSString *faceName;

@end

@interface FaceGroupModel : NSObject

@property (nonatomic,assign) FaceType faceType;
@property (nonatomic,strong) NSString *groupID;
@property (nonatomic,strong) NSString *groupImageName;
@property (nonatomic,strong) NSArray  *facesArray;


@end
