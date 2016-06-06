//
//  ConversationCell.h
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "MessageListModel.h"

@interface MessageListCell : CommonTableViewCell

@property (nonatomic,strong) MessageListModel *messageListModel;


@property (nonatomic,strong) UIImageView *avatarImageView;  //头像
@property (nonatomic,strong) UILabel *usernameLabel;        //用户名
@property (nonatomic,strong) UILabel *dateLabel;            //时间
@property (nonatomic,strong) UILabel *messageLabel;         //消息

@end
