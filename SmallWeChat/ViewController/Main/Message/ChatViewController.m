//
//  ChatViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatMessageViewController.h"
#import "ChatBoxViewController.h"
#import "UserHelper.h"
#import "UIView+Frame.h"

@interface ChatViewController ()<ChatMessageViewControllerDelegate,ChatBoxViewControllerDelegate>
{
    CGFloat viewHeight;
}

@property (nonatomic,strong) ChatMessageViewController *chatMessageVC;
@property (nonatomic,strong) ChatBoxViewController *chatBoxVC;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    viewHeight = HEIGHT_SCREEN - HEIGHT_NAVBAR - HEIGHT_STATUSBAR;
    
    [self.view addSubview:self.chatMessageVC.view];
    [self addChildViewController:self.chatMessageVC];
    [self.view addSubview:self.chatBoxVC.view];
    [self addChildViewController:self.chatBoxVC];
    // Do any additional setup after loading the view.0
}

#pragma mark - ChatMessageViewControllerDelegate methods
-(void)didTapChatMessageView:(ChatMessageViewController *)chatMessageViewController
{
    [self.chatBoxVC resignFirstResponder];

}

#pragma mark - ChatBoxViewControllerDelegate methods
-(void)chatBoxViewController:(ChatBoxViewController *)chatBoxViewController sendMessage:(MessageModel *)message
{
    message.fromUserModel = [UserHelper sharedUserHelper].userModel;
    [self.chatMessageVC addNewMessage:message];
    
    MessageModel *recMessage = [[MessageModel alloc]init];
    recMessage.messageType = message.messageType;
    recMessage.ownerType = MessageOwnerTypeOther;
    recMessage.date = [NSDate date];
    recMessage.text = message.text;
    recMessage.imagePath = message.imagePath;
    recMessage.fromUserModel = message.fromUserModel;
    [self.chatMessageVC addNewMessage:recMessage];
    [self.chatMessageVC scrollToBottom];
}

-(void)chatBoxViewController:(ChatBoxViewController *)chatBoxViewController didChangaeChatBoxHeight:(CGFloat)height
{
    self.chatMessageVC.view.frameHeight = viewHeight - height;
    self.chatBoxVC.view.originY = self.chatMessageVC.view.originY + self.chatMessageVC.view.frameHeight;
    [self.chatMessageVC scrollToBottom];
}

#pragma mark - Getter and Setter
-(void)setUserModel:(UserModel *)userModel
{
    _userModel = userModel;
    [self.navigationItem setTitle:userModel.userName];

}
-(ChatMessageViewController *)chatMessageVC
{
    if(_chatMessageVC == nil){
        _chatMessageVC = [[ChatMessageViewController alloc]init];
        [_chatMessageVC.view setFrame:CGRectMake(0, HEIGHT_STATUSBAR + HEIGHT_NAVBAR, WIDTH_SCREEN, viewHeight - HEIGHT_TABBAR)];
        [_chatMessageVC setDelegate:self];
    }
    return _chatMessageVC;
}

-(ChatBoxViewController *)chatBoxVC
{
    if (_chatBoxVC == nil) {
        _chatBoxVC = [[ChatBoxViewController alloc]init];
         [_chatBoxVC.view setFrame:CGRectMake(0,HEIGHT_SCREEN - HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_SCREEN)];
        [_chatBoxVC setDelegate:self];
    }
    return _chatBoxVC;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
