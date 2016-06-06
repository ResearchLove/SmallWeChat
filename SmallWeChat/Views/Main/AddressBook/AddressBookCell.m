//
//  AddressBookCell.m
//  SmallWeChat
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "AddressBookCell.h"

@interface AddressBookCell()

@property (nonatomic,strong) UIImageView *avatarImageView;
@property (nonatomic,strong) UILabel *userNameLabel;

@end

@implementation AddressBookCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.avatarImageView];
        [self addSubview:self.userNameLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    self.leftFreeSpace = self.frameHeight * 0.18;
    [super layoutSubviews];
    
    float spaceX = self.frameHeight * 0.18;
    float spaceY = self.frameHeight * 0.17;
    float imageWidth = self.frameHeight -  spaceY * 2;
    [_avatarImageView setFrame:CGRectMake(spaceX, spaceY,imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    float labelWidth = self.frameWidth - labelX - spaceX * 0.15;
    [_userNameLabel setFrame:CGRectMake(labelX, spaceY, labelWidth, imageWidth)];
}

-(void)setUserMoel:(UserModel *)userMoel
{

    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",userMoel.avatarURL]]];
    [_userNameLabel setText:userMoel.userName];

}

#pragma mark - Getter and Setter
-(UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc]init];
    }
    return _avatarImageView;
}

-(UILabel *)userNameLabel
{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        [_userNameLabel setFont:[UIFont systemFontOfSize:17.0]];
    }
    return _userNameLabel;


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
