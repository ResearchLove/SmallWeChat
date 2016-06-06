//
//  MessageViewController.h
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTableViewController.h"
#import "MessageSerchViewController.h"


@interface MessageListViewController : CommonTableViewController<UISearchBarDelegate>

@property (nonatomic, strong) UIBarButtonItem *navRightButton;
@property (nonatomic, strong) UISearchController *searchController;
@property (strong,nonatomic) MessageSerchViewController *messageSerchVC;  //消息搜索

@property (strong,nonatomic)NSMutableArray *messageListDataAry; //消息列表数据

@end
