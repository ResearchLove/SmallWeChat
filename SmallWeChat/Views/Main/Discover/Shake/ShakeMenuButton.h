//
//  ShakeMenuButton.h
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShakeMenuButton : UIButton

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIImage *imageHL;

-(id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName
       imageHLName:(NSString *)imageHLName
             title:(NSString *)title
            traget:(id)target
            action:(SEL)action;

-(void)setChoosed:(BOOL)choosed;
@end
