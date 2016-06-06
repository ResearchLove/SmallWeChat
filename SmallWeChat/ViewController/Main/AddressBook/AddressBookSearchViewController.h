//
//  AddressBookSearchViewController.h
//  SmallWeChat
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "CommonTableViewController.h"

@interface AddressBookSearchViewController : CommonTableViewController <UISearchResultsUpdating>

@property (nonatomic, copy) NSMutableArray *friendsArray;

@end
