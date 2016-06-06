//
//  AddressBookSearchViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "AddressBookSearchViewController.h"
#import "AddressBookCell.h"

@interface AddressBookSearchViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation AddressBookSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[AddressBookCell class] forCellReuseIdentifier:@"FriendCell"];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    _data = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.tableView.originY = HEIGHT_NAVBAR + HEIGHT_STATUSBAR;
    self.tableView.frameHeight = HEIGHT_SCREEN - self.tableView.originY;

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;

}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return @"联系人";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressBookCell"];
    if (cell == nil) {
        cell = [[AddressBookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddressBookCell"];
    }
    UserModel *user = [_data objectAtIndex:indexPath.row];
    [cell setUserMoel:user];
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == _data.count - 1 ? [cell setBottonLineStyle:CellLineStyleFill] : [cell setBottonLineStyle:CellLineStyleDefault];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.5f;
}
#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    [_data removeAllObjects];
    for (UserModel *user in _friendsArray) {
        if ([user.userId containsString:searchText] || [user.userName containsString:searchText] || [user.nikeName containsString:searchText] || [user.pinyin containsString:searchText] || [user.initial containsString:searchText]) {
            [_data addObject:user];
        }
    }
    [self.tableView reloadData];
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
