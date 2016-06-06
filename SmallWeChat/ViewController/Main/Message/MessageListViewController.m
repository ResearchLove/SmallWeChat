//
//  MessageViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "MessageListViewController.h"
#import "MessageListCell.h"
#import "MessageListModel.h"
#import "ChatViewController.h"
#import "UserModel.h"

@interface MessageListViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) ChatViewController *chatVC;

@end


@implementation MessageListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"消息"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.navigationItem setRightBarButtonItem:self.navRightButton];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView registerClass:[MessageListCell class] forCellReuseIdentifier:@"MessageListCell"];
    
    _messageListDataAry = [self getMeesageData];
    
    // Do any additional setup after loading the view.
}


#pragma mark - Getter and Setter UIBarButtonItem
- (UIBarButtonItem *) navRightButton
{
    if (_navRightButton == nil) {
        _navRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(navRightButtonEvent:)];
    }
    return _navRightButton;
}

#pragma mark - Event Response
- (void) navRightButtonEvent:(UIButton *)sender
{
    NSLog(@"Your lick rightButton....");
    
}

#pragma mark - MessageSerchViewController 初始化
-(MessageSerchViewController *)messageSerchVC
{
    if (_messageSerchVC == nil) {
        _messageSerchVC = [[MessageSerchViewController alloc]init];
    }
    return _messageSerchVC;
    
}

#pragma mark - UISearchBarDelegate methods
-(UISearchController *)searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:_messageSerchVC];
        [_searchController setSearchResultsUpdater:self.messageSerchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:WBColor(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;

}

#pragma  mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_messageListDataAry count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"MessageListCell";
    MessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    [cell setMessageListModel:_messageListDataAry[indexPath.row]];
    [cell setTopLineStyle:CellLineStyleNone];
//    if ([indexPath row] == [_messageListDataAry count] - 1) {
//        [cell setBottomLineStyle:CellLineStyleFill];
//    }else{
//        [cell setBottomLineStyle:CellLineStyleDefault];
//    }
    return cell;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


#pragma  mark - UITableViewDelegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}



#pragma mark - UITableViewDelegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (_chatVC == nil) {
        _chatVC = [[ChatViewController alloc]init];
    }
    UserModel *userModel = [[UserModel alloc] init];
    userModel.userName = @"莫小贝";
    userModel.userId = @"XB";
    userModel.nikeName = @"小贝";
    userModel.avatarURL = @"10.jpeg";
    _chatVC.userModel = userModel;
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_chatVC animated:YES];

}


#pragma mark - 获取消息列表数据
-(NSMutableArray *)getMeesageData
{
    NSMutableArray *messageListDataAry = [[NSMutableArray alloc]init];
    MessageListModel *messageListModel = [[MessageListModel alloc]init];
    messageListModel.fromName = @"许嵩";
    messageListModel.messageCon = @"帅哥你好！";
    messageListModel.avatarURL = [NSURL URLWithString:@"10.jpeg"];
    messageListModel.messageCount = 1;
    messageListModel.date = [NSDate date];
    [messageListDataAry addObject:messageListModel];
    return messageListDataAry;

}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
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
