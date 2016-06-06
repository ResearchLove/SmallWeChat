//
//  TextMessageCell.m
//  SmallWeChat
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "TextMessageCell.h"
#import "UIView+Frame.h"

@implementation TextMessageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.messageTextLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    float y = self.avatarImageView.originY + 11;
    float x = self.avatarImageView.originX + (self.messageModel.ownerType == MessageOwnerTypeSelf ? - self.messageTextLabel.frameWidth - 27 : self.avatarImageView.frameWidth + 23);
    [self.messageTextLabel setOrigin:CGPointMake(x, y)];
    
    x -= 18;                                    // 左边距离头像 5
    y = self.avatarImageView.originY - 5;       // 上边与头像对齐 (北京图像有5个像素偏差)
    float h = MAX(self.messageTextLabel.frameHeight + 30, self.avatarImageView.frameHeight + 10);
    [self.messageBackgroundImageView setFrame:CGRectMake(x, y, self.messageTextLabel.frameWidth + 40, h)];
}

#pragma mark - Getter and Setter
-(void)setMessageModel:(MessageModel *)messageModel
{
    [super setMessageModel:messageModel];
    [_messageTextLabel setAttributedText:messageModel.attrText];
    _messageTextLabel.size = messageModel.messageSize;
}

-(UILabel *)messageTextLabel
{
    if (_messageTextLabel == nil) {
        _messageTextLabel = [[UILabel alloc]init];
        [_messageTextLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_messageTextLabel setNumberOfLines:0];
    }
    return _messageTextLabel;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
