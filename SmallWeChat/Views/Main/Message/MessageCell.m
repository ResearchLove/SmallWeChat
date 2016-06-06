//
//  MessageCell.m
//  SmallWeChat
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "MessageCell.h"
#import "UIView+Frame.h"

@implementation MessageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.avatarImageView];
        [self addSubview:self.messageBackgroundImageView];
    }
    return self;
}

-(void)layoutSubviews
{

    [super layoutSubviews];
    if (_messageModel.ownerType == MessageOwnerTypeSelf) {
        [self.avatarImageView setOrigin:CGPointMake(self.frameWidth - 10 - self.avatarImageView.frameWidth, 10)];
    }else if(_messageModel.ownerType == MessageOwnerTypeOther){
        [self.avatarImageView setOrigin:CGPointMake(10, 10)];
    }
}

#pragma mark - Getter and Setter
-(void)setMessageModel:(MessageModel *)messageModel
{
    _messageModel = messageModel;
    switch (messageModel.ownerType) {
        case MessageOwnerTypeSelf:
            [self.avatarImageView setHidden:NO];
            [self.avatarImageView setImage:[UIImage imageNamed:messageModel.fromUserModel.avatarURL]];
            [self.messageBackgroundImageView setHidden:NO];
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_sender_background_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            self.messageBackgroundImageView.highlightedImage = [[UIImage imageNamed:@"message_sender_background_highlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        case MessageOwnerTypeOther:
            [self.avatarImageView setHidden:NO];
            [self.avatarImageView setImage:[UIImage imageNamed:messageModel.fromUserModel.avatarURL]];
            [self.messageBackgroundImageView setHidden:NO];
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_receiver_background_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            self.messageBackgroundImageView.highlightedImage = [[UIImage imageNamed:@"message_receiver_background_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        case MessageOwnerTypeSystem:
            [self.avatarImageView setHidden:YES];
            [self.messageBackgroundImageView setHidden:YES];
            break;
        default:
            break;
    }

}

-(UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        float imageWidth = 40;
        _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageWidth, imageWidth)];
        [_avatarImageView setHidden:YES];
    }
    return _avatarImageView;
}

-(UIImageView *)messageBackgroundImageView
{
    if (_messageBackgroundImageView == nil) {
        _messageBackgroundImageView = [[UIImageView alloc]init];
        [_messageBackgroundImageView setHidden:YES];
    }
    return _messageBackgroundImageView;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
