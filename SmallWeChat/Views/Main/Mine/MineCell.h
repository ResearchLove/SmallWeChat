//
//  MineCell.h
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "UserModel.h"

typedef NS_ENUM(NSInteger, MineCellType) {
    MineCellTypeFriends,
    MineCellTypeMine,

};

@interface MineCell : CommonTableViewCell
@property (nonatomic,assign)MineCellType cellType;
@property (nonatomic,strong) UserModel *userModel;

@end
