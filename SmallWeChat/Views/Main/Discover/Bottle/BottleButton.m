//
//  BottleButton.m
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "BottleButton.h"

@implementation BottleButton

-(id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 10)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height - 18, frame.size.width, 10)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setText:title];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
        
    }
    return self;


}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
