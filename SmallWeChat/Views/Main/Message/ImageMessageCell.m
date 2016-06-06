//
//  ImageMessageCell.m
//  SmallWeChat
//
//  Created by apple on 15/12/25.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "ImageMessageCell.h"
#import "UIView+Frame.h"

@implementation ImageMessageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self insertSubview:self.messageImageView aboveSubview:self.messageBackgroundImageView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    float y = self.avatarImageView.originY - 3;
    if (self.messageModel.ownerType == MessageOwnerTypeSelf) {
        float x = self.avatarImageView.originX - self.messageImageView.frameWidth - 5;
        [self.messageImageView setOrigin:CGPointMake(x , y)];
        [self.messageBackgroundImageView setFrame:CGRectMake(x, y, self.messageModel.messageSize.width+ 10, self.messageModel.messageSize.height + 10)];
    }else if(self.messageModel.ownerType == MessageOwnerTypeOther){
        float x = self.avatarImageView.originX + self.avatarImageView.frameWidth + 5;
        [self.messageImageView setOrigin:CGPointMake(x, y)];
        [self.messageBackgroundImageView setFrame:CGRectMake(x, y, self.messageModel.messageSize.width+ 10, self.messageModel.messageSize.height + 10)];
    }
}

#pragma mark - Getter and Setter
-(void)setMessageModel:(MessageModel *)messageModel
{
    [super setMessageModel:messageModel];
    if (messageModel.imagePath != nil) {
        if (messageModel.imagePath.length > 0) {
            [self.messageImageView setImage:messageModel.image];
        }else{
        
        }
    }
    switch (self.messageModel.ownerType) {
        case MessageOwnerTypeSelf:
             self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_sender_background_reversed"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        case MessageOwnerTypeOther:
            self.messageBackgroundImageView.image = [[UIImage imageNamed:@"message_receiver_background_reversed"] resizableImageWithCapInsets:UIEdgeInsetsMake(28, 20, 15, 20) resizingMode:UIImageResizingModeStretch];
            break;
        default:
            break;
    }
}

-(UIImageView *)messageImageView
{
    if (_messageImageView == nil) {
        _messageImageView = [[UIImageView alloc]init];
        [_messageImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_messageImageView setClipsToBounds:YES];
    }
    return _messageImageView;


}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
