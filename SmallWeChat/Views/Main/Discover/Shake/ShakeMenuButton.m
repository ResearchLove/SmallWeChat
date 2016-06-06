//
//  ShakeMenuButton.m
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "ShakeMenuButton.h"

@interface ShakeMenuButton()
{
    UIImageView *imageView;
    UILabel *titleLabel;
}

@end

@implementation ShakeMenuButton

-(id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName imageHLName:(NSString *)imageHLName title:(NSString *)title traget:(id)target action:(SEL)action
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
        _image = [UIImage imageNamed:imageName];
        _imageHL = [UIImage imageNamed:imageHLName];
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 32)];
        [imageView setImage:_image];
        [self addSubview:imageView];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height - 20, frame.size.width, 10)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setText:title];
        [titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
    }
    return self;
}

-(void)setChoosed:(BOOL)choosed
{
    if (choosed) {
        [imageView setImage:_imageHL];
        [titleLabel setTextColor:DEFAULT_GREEN_COLOR];
        
    }else{
        [imageView setImage:_image];
        [titleLabel setTextColor:[UIColor whiteColor]];
    
    }


}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
