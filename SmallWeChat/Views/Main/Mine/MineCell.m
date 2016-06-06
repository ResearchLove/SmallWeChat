//
//  MineCell.m
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "MineCell.h"

@interface MineCell ()

@property (nonatomic,strong) UILabel *userNameLable;
@property (nonatomic,strong) UILabel *userIDLabel;
@property (nonatomic,strong) UILabel *nikeNameLabel;
@property (nonatomic,strong) UIImageView *avatarImageView;
@property (nonatomic,strong) UIImageView *subImageView;

@end


@implementation MineCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.avatarImageView];
        [self addSubview:self.userNameLable];
        [self addSubview:self.userIDLabel];
        [self addSubview:self.nikeNameLabel];
    }
    return self;
}

-(void)layoutSubviews
{
   [super layoutSubviews];
    
    self.leftFreeSpace = self.frameWidth * 0.05;
    
    float spaceX = self.frameWidth * 0.04;
    float spaceY = self.frameHeight * 0.15;
    float imageWidth = self.frameHeight - spaceY * 2;
    [_avatarImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    float labelWidth = self.frameWidth - labelX - spaceX * 1.5;
    CGSize size = [_userNameLable sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    float labelHeight = imageWidth * 0.42;
    size.width = size.width > labelWidth ? labelWidth : size.width;
    float labelY = _cellType == MineCellTypeMine ? spaceY * 1.45 : spaceY;
    [_userNameLable setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    
    size = [_userIDLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    labelY += labelHeight + (_cellType == MineCellTypeMine ? spaceY * 0.3 : spaceY * 0.2);
    [_userIDLabel setFrame:CGRectMake(labelX, labelY, size.width, size.height)];
    
    size = [_nikeNameLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    labelY = _userIDLabel.originY + _userIDLabel.frameHeight + spaceY * 0.15;
    [_nikeNameLabel setFrame:CGRectMake(labelX, labelY,size.width, size.height)];
    
}

-(void)setUserModel:(UserModel *)userModel
{
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%@", userModel.avatarURL]]];
    if (userModel.userName && userModel.userName.length > 0) {
        [_userNameLable setText:userModel.userName];
        if (userModel.nikeName && userModel.nikeName.length > 0) {
            [_userNameLable setText:[NSString stringWithFormat:@"昵称：%@", userModel.nikeName]];
        }else{
            [_nikeNameLabel setText:@""];
        }
    }else if(userModel.nikeName && userModel.nikeName.length > 0){
        [_userNameLable setText:userModel.nikeName];
    
    }
    if (userModel.userId && userModel.userId.length > 0) {
        [_userIDLabel setText:[NSString stringWithFormat:@"微信号：%@", userModel.userId]];
    }else{
        [_userIDLabel setText:@""];
    }
}

- (void)setCellType:(MineCellType)cellType
{
    _cellType = cellType;
    switch (_cellType) {
        case MineCellTypeFriends:
            [_userIDLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
            [_userIDLabel setFont:[UIFont systemFontOfSize:13.0f]];
            break;
        case MineCellTypeMine:
            [_userIDLabel setTextColor:[UIColor blackColor]];
            [_userIDLabel setFont:[UIFont systemFontOfSize:14.0f]];
            break;
        default:
            break;
    }
    [self sizeToFit];
}

-(UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc]init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
    }
    return _avatarImageView;
}

-(UILabel *)userNameLable
{
    if (_userNameLable == nil) {
        _userNameLable = [[UILabel alloc]init];
        [_userNameLable setFont:[UIFont systemFontOfSize:17.0f]];
    }
    return _userNameLable;
}

-(UILabel *)userIDLabel
{
    if (_userIDLabel == nil) {
        _userIDLabel = [[UILabel alloc]init];
        [_userIDLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_userIDLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
    }
    return _userIDLabel;
}

-(UILabel *)nikeNameLabel
{
    if (_nikeNameLabel == nil) {
        _nikeNameLabel = [[UILabel alloc]init];
        [_nikeNameLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [_nikeNameLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
    }
    return _nikeNameLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
