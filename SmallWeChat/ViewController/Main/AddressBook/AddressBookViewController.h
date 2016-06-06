//
//  AddressBookViewController.h
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTableViewController.h"

@interface AddressBookViewController : CommonTableViewController

@property (nonatomic,strong) NSMutableArray *friendsAry;    //好友列表数据
@property (nonatomic,strong) NSMutableArray *dataAry;       //格式化的好友列表数据
@property (nonatomic,strong) NSMutableArray *sectionAry;    //拼音首字母列表

@end
