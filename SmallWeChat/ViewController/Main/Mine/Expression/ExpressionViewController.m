//
//  ExpressionViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "ExpressionViewController.h"
#import "UIView+Frame.h"

@interface ExpressionViewController ()

@property (nonatomic,strong) UISegmentedControl *segmentedControl;
@property (nonatomic,strong) UIBarButtonItem *rightBarButtonItem;

@end

@implementation ExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitleView:self.segmentedControl];
    [self.navigationItem setRightBarButtonItem:self.rightBarButtonItem];
    // Do any additional setup after loading the view.
}


#pragma mark - Getter and Setter
-(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"精选表情",@"投稿表情"]];
        [_segmentedControl setFrameWidth:WIDTH_SCREEN * 0.6];
        [_segmentedControl setSelectedSegmentIndex:0];
        [_segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _segmentedControl;
}

-(UIBarButtonItem *)rightBarButtonItem
{
    if (_rightBarButtonItem == nil) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    }
    return _rightBarButtonItem;
}

- (void) segmentedControlChanged:(UISegmentedControl *)segmentedControl
{
    
}


- (void) rightBarButtonDown
{
    
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
