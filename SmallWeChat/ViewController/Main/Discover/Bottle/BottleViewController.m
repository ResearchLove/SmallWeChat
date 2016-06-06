//
//  BottleViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "BottleViewController.h"
#import "BottleButton.h"
#import "UIView+Frame.h"

@interface BottleViewController ()
{
    NSTimer *timer;
    UITapGestureRecognizer *tap;

}

@property (nonatomic,strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic,strong) UIView *bgView;


@end

@implementation BottleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"漂流瓶"];
    [self.navigationItem setRightBarButtonItem:self.rightBarButtonItem];
    [self.view addSubview:self.bgView];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(tryHiddenNavBar) userInfo:nil repeats:NO];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
    [self.view addGestureRecognizer:tap];

}


- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self hiddenNavBar:NO];
    [timer invalidate];
    [self.view removeGestureRecognizer:tap];
}

-(void)didTapView
{

    [timer invalidate];
    [self hiddenNavBar:![self.navigationController.navigationBar isHidden]];

}

-(UIView *)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:_bgView.frame];
        NSDate *date = [NSDate date];
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:@"HH"];
        int hour = [dataFormatter stringFromDate:date].intValue;
        if (hour >= 6 && hour <= 18) {
            [bgImageView setImage:[UIImage imageNamed:@"bottleBkg.jpg"]];
        }else{
            [bgImageView setImage:[UIImage imageNamed:@"bottleNightBkg.jpg"]];
        
        }
        [_bgView addSubview:bgImageView];
        float h = WIDTH_SCREEN / 640 * 92;
         UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottleBoard"]];
        [bottomImageView setFrame:CGRectMake(0, HEIGHT_SCREEN - h, WIDTH_SCREEN, h)];
        [_bgView addSubview:bottomImageView];
        
        float w = WIDTH_SCREEN / 4;
        float space = (WIDTH_SCREEN - w *3) / 4;
        h = w / 152 * 172 + 10;
        float y = HEIGHT_SCREEN - h;
        float x = space;
        BottleButton *throwButton = [[BottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                                  imageName:@"bottleButtonThrow"
                                                                      title:@"扔一个"
                                                                     target:self
                                                                     action:@selector(bottleButtonDown:)];
        throwButton.tag = 1;
        [_bgView addSubview:throwButton];
        
        x += w +space;
        BottleButton *gatherButton = [[BottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                                   imageName:@"bottleButtonFish"
                                                                       title:@"捡一个"
                                                                      target:self
                                                                      action:@selector(bottleButtonDown:)];
        gatherButton.tag = 2;
        [_bgView addSubview:gatherButton];
        
        
        x += w + space;
        BottleButton *mineButton = [[BottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                                 imageName:@"bottleButtonMine"
                                                                     title:@"我的瓶子"
                                                                    target:self
                                                                    action:@selector(bottleButtonDown:)];
        mineButton.tag = 3;
        [_bgView addSubview:mineButton];
    }
    return _bgView;
}




#pragma mark - tryHiddenNavBar
-(void)tryHiddenNavBar
{
    [timer invalidate];
    [self hiddenNavBar:YES];
}

#pragma mark - 仍一个/捡一个/我的瓶子事件
- (void) bottleButtonDown:(BottleButton *)sender
{
    
}


#pragma mark - 影藏/显示导航栏
-(void)hiddenNavBar:(BOOL)hidden
{
    if (hidden) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        [UIView animateWithDuration:0.5 animations:^{
             [self.navigationController.navigationBar setOriginY: -HEIGHT_NAVBAR - HEIGHT_STATUSBAR];
        } completion:^(BOOL finished) {
            [self.navigationController.navigationBar setHidden:YES];
        }];
        
    }else{
        [self.navigationController.navigationBar setHidden:NO];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController.navigationBar setOriginY:HEIGHT_STATUSBAR];
        }];
    
    }

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
