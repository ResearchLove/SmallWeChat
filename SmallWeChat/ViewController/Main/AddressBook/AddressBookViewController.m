//
//  AddressBookViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookCell.h"
#import "AddressBookHeaderView.h"
#import "MembersDetailsSettingViewController.h"
#import "MembersDetailsViewController.h"
#import "AddressBookSearchViewController.h"
#import "AddAddressMembersViewController.h"
#import "DataHelper.h"

@interface AddressBookViewController ()<UISearchBarDelegate>

@property (nonatomic,strong) SettingGrounp *funcionGroup; //功能列表
@property (nonatomic, strong) UIBarButtonItem *addFriendButton;
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) UILabel *footerLabel;

@property (nonatomic,strong)AddAddressMembersViewController *addAddressMembersVC;
@property (nonatomic,strong) AddressBookSearchViewController*addressBookSearchVC;
@property (nonatomic,strong)MembersDetailsViewController *membersDetailsVC;

@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"通讯录"];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    [self.tableView registerClass:[AddressBookCell class] forCellReuseIdentifier:@"AddressBookCell"];
    [self.tableView registerClass:[AddressBookHeaderView class] forHeaderFooterViewReuseIdentifier:@"AddressBookHeaderView"];
//    [self.tableView setTableHeaderView:self.searchController.searchBar];
//    [self.tableView setTableFooterView:self.footerLabel];
    [self.navigationItem setRightBarButtonItem:self.addFriendButton];
    
    [self initTestData];
    // Do any additional setup after loading the view.
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataAry.count + 1;


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _funcionGroup.itemsCount;
    }
    NSArray *array = [_dataAry objectAtIndex:section -1];
    return array.count;

}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressBookCell"];
    if (indexPath.section == 0) {
        SettingItem *item = [_funcionGroup itemAtIndex:indexPath.row];
        UserModel *user = [[UserModel alloc]init];
        user.userName = item.title;
        user.avatarURL = item.imageName;
        [cell setUserMoel:user];
        [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == _funcionGroup.itemsCount - 1 ? [cell setBottonLineStyle:CellLineStyleNone] :[cell setBottonLineStyle:CellLineStyleDefault];
    }else{
        NSArray *array = [_dataAry objectAtIndex:indexPath.section - 1];
        UserModel *user = [array objectAtIndex:indexPath.row];
        [cell setUserMoel:user];
        [cell setTopLineStyle:CellLineStyleNone];
        if (indexPath.row == array.count - 1) {
           indexPath.section == _dataAry.count ? [cell setBottonLineStyle:CellLineStyleFill] :[cell setBottonLineStyle:CellLineStyleNone];
        }else{
            [cell setBottonLineStyle:CellLineStyleDefault];
        }
    }
      return cell;
}


#pragma mark - UITabelViewDelegate Methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.5f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 22.0f;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    AddressBookHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"AddressBookHeaderView"];
    [view setTitle:[self.sectionAry objectAtIndex:section]];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0 ) {
        
    }else{
        NSArray *array = [_dataAry objectAtIndex:indexPath.section - 1];
        self.membersDetailsVC.userModel = [array objectAtIndex:indexPath.row];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.membersDetailsVC animated:YES];
    
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - 拼音首字母检索
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionAry;
}

#pragma mark - 检索时空出搜索框
- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];
        return -1;
    }
    return index;
}

#pragma mark - Private Methods
-(void)initTestData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        _friendsAry = [[NSMutableArray alloc] initWithCapacity:3];
        UserModel *user1 = [[UserModel alloc] init];
        user1.userName = @"吕轻侯";
        user1.nikeName = @"侯哥";
        user1.userId = @"yun";
        user1.avatarURL = @"1.jpg";
        [_friendsAry addObject:user1];
        UserModel *user2 = [[UserModel alloc] init];
        user2.userName = @"白展堂";
        user2.userId = @"小白2";
        user2.nikeName = @"堂堂";
        user2.avatarURL = @"4.jpg";
        [_friendsAry addObject:user2];
        UserModel *user3 = [[UserModel alloc] init];
        user3.userName = @"李秀莲";
        user3.userId = @"xiulian";
        user3.nikeName = @"大嘴";
        user3.avatarURL = @"8.jpg";
        [_friendsAry addObject:user3];
        UserModel *user4 = [[UserModel alloc] init];
        user4.userName = @"燕小六";
        user4.userId = @"xiao6";
        user4.avatarURL = @"11.jpg";
        [_friendsAry addObject:user4];
        UserModel *user5 = [[UserModel alloc] init];
        user5.userName = @"郭芙蓉";
        user5.userId = @"furongMM";
        user5.avatarURL = @"12.jpg";
        [_friendsAry addObject:user5];
        UserModel *user6 = [[UserModel alloc] init];
        user6.userName = @"佟湘玉";
        user6.userId = @"yu";
        user6.nikeName = @"掌柜嗒";
        user6.avatarURL = @"7.jpg";
        [_friendsAry addObject:user6];
        UserModel *user7 = [[UserModel alloc] init];
        user7.userName = @"莫小贝";
        user7.userId = @"XB";
        user7.nikeName = @"小贝";
        user7.avatarURL = @"10.jpeg";
        [_friendsAry addObject:user7];
    
        _funcionGroup = [UIHelper getFriensListItemGroup];
        
        _dataAry = [DataHelper getFriendListDataBy:_friendsAry];
        _sectionAry = [DataHelper getFriendListSectionBy:_dataAry];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [_footerLabel setText:[NSString stringWithFormat:@"%lu位联系人", (unsigned long)_friendsAry.count]];
        });
    });
}

#pragma mark - Getter and Setter
- (UIBarButtonItem *) addFriendButton
{
    if (_addFriendButton == nil) {
        _addFriendButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriendButtonDown)];
    }
    return _addFriendButton;
}

- (AddressBookSearchViewController *) addressBookSearchVC
{
    if (_addressBookSearchVC == nil) {
        _addressBookSearchVC = [[AddressBookSearchViewController alloc] init];
    }
    return _addressBookSearchVC;
}

- (UISearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.addressBookSearchVC];
        [_searchController setSearchResultsUpdater: self.addressBookSearchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:WBColor(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

- (UILabel *) footerLabel
{
    if (_footerLabel == nil) {
        _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 49.0f)];
        [_footerLabel setBackgroundColor:[UIColor whiteColor]];
        [_footerLabel setTextColor:[UIColor grayColor]];
        [_footerLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _footerLabel;
}

- (AddAddressMembersViewController *) addAddressMembersVC
{
    if (_addAddressMembersVC == nil) {
        _addAddressMembersVC = [[AddAddressMembersViewController alloc] init];
    }
    return _addAddressMembersVC;
}

- (MembersDetailsViewController *) membersDetailsVC
{
    if (_membersDetailsVC == nil) {
        _membersDetailsVC = [[MembersDetailsViewController alloc] init];
    }
    return _membersDetailsVC;
}

- (void) addFriendButtonDown
{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.addAddressMembersVC animated:YES];
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
