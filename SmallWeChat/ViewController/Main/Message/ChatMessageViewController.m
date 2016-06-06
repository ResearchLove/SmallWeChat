//
//  ChatMessageViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "ChatMessageViewController.h"
#import "TextMessageCell.h"
#import "ImageMessageCell.h"
#import "VoiceMessageCell.h"
#import "SystemMessageCell.h"


@interface ChatMessageViewController()

@property (nonatomic,strong) UITapGestureRecognizer *tapGR;

@end


@implementation ChatMessageViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULT_CHAT_BACKGROUND_COLOR];
    [self.view addGestureRecognizer:self.tapGR];
    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView registerClass:[TextMessageCell class] forCellReuseIdentifier:@"TextMessageCell"];
    [self.tableView registerClass:[ImageMessageCell class] forCellReuseIdentifier:@"ImageMessageCell"];
    [self.tableView registerClass:[VoiceMessageCell class] forCellReuseIdentifier:@"VoiceMessageCell"];
    [self.tableView registerClass:[SystemMessageCell class] forCellReuseIdentifier:@"SystemMessageCell"];

}

#pragma mark -Public Methods
-(void)addNewMessage:(MessageModel *)message
{
    [self.data addObject:message];
    [self.tableView reloadData];

}

-(void)scrollToBottom
{
    if (_data.count > 0) {
         [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_data.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }

}

#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *messageModel = [_data objectAtIndex:indexPath.row];
    id cell = [tableView dequeueReusableCellWithIdentifier:messageModel.cellIdentify];
    [cell setMessageModel:messageModel];
    return cell;

}

#pragma mark - UITableViewCellDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *messageModel = [_data objectAtIndex:indexPath.row];
    return messageModel.cellHeight;
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark - Event Response
-(void)didTapView
{
    if (_delegate && [_delegate respondsToSelector:@selector(didTapChatMessageView:)]) {
        [_delegate didTapChatMessageView:self];
    }

}

#pragma mark - Getter
-(UITapGestureRecognizer *)tapGR
{
    if (_tapGR == nil) {
        _tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapView)];
    }
    return _tapGR;
}
-(NSMutableArray *)data
{
    if (_data == nil) {
        _data = [[NSMutableArray alloc]init];
    }
    return _data;

}

@end
