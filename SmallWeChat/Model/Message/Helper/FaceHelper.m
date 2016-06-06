//
//  FaceHelper.m
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "FaceHelper.h"

static FaceHelper *faceHelper = nil;

@implementation FaceHelper

+(FaceHelper *)sharedFaceHelper
{

    if (faceHelper == nil) {
        faceHelper = [[FaceHelper alloc]init];
    }
    return faceHelper;
}

#pragma mark - Public Methods
-(NSArray *)getFaceArrayByGroupID:(NSString *)groupID
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:groupID ofType:@"plist"]];
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dict in array) {
        FaceModel *faceModel = [[FaceModel alloc]init];
        faceModel.faceId = [dict objectForKey:@"face_id"];
        faceModel.faceName = [dict objectForKey:@"face_name"];
        [data addObject:faceModel];
    }
    return data;
}

#pragma mark - Getter
-(NSMutableArray *)faceGroupArray
{
    if (_faceGroupArray == nil) {
        _faceGroupArray = [[NSMutableArray alloc]init];
        FaceGroupModel *faceGroupModel = [[FaceGroupModel alloc]init];
        faceGroupModel.faceType = FaceTypeEmoji;
        faceGroupModel.groupID = @"normal_face";
        faceGroupModel.groupImageName = @"EmotionsEmojiHL";
        faceGroupModel.facesArray = nil;
        [_faceGroupArray addObject:faceGroupModel];
    }
    return _faceGroupArray;
}


@end
