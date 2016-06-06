//
//  ConversationCell.m
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "MessageListCell.h"

@implementation MessageListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.avatarImageView];
        [self addSubview:self.usernameLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.messageLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = self.frameHeight * 0.14;
    
    [super layoutSubviews];
    
    float imageWitdth = self.frameHeight * 0.72;
    float space = self.leftFreeSpace;
    [_avatarImageView setFrame:CGRectMake(space, space, imageWitdth, imageWitdth)];
    
    float labelX = space * 2 + imageWitdth;
    float labelY = self.frameHeight * 0.135;
    float labelHeight = self.frameHeight * 0.4;
    float labelWidth = self.frameWidth - labelX - space * 1.5;
    
    float dateWidth  = 70;
    float dateHeight = labelHeight * 0.75;
    float dateX =  self.frameWidth - space * 1.5 - dateWidth;
    [_dateLabel setFrame:CGRectMake(dateX, labelY * 0.7, dateWidth, dateHeight)];
    
    float usernameLabelWidth = self.frameWidth - labelY - dateWidth - space*2;
    [_usernameLabel setFrame:CGRectMake(labelX, labelY, usernameLabelWidth, labelHeight)];
    
    
    labelY = self.frameHeight * 0.91 - labelHeight;
    [_messageLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];

}

-(void) setMessageListModel:(MessageListModel *)messageListModel
{
    _messageListModel = messageListModel;
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",_messageListModel.avatarURL]]];
    [_usernameLabel setText:_messageListModel.fromName];
    [_dateLabel setText:@"11:01"];
    [_messageLabel setText:_messageListModel.messageCon];

}

#pragma mark - Getter and Setter 

-(UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc]init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
        return _avatarImageView;
    }
    return _avatarImageView;
}

-(UILabel *)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc]init];
        [_usernameLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _usernameLabel;
}

-(UILabel *)dateLabel
{
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc]init];
        [_dateLabel setAlpha:0.8];
        [_dateLabel setFont:[UIFont systemFontOfSize:12]];
        [_dateLabel setTextAlignment:NSTextAlignmentRight];
        [_dateLabel setTextColor:[UIColor grayColor]];
        
    }
    return _dateLabel;
}

-(UILabel *)messageLabel
{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc]init];
        [_messageLabel setTextColor:[UIColor grayColor]];
        [_messageLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _messageLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
