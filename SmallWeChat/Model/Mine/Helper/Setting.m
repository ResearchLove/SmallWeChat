//
//  Setting.m
//  SmallWeChat
//
//  Created by apple on 16/1/7.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "Setting.h"

@implementation SettingItem

-(id) init
{

    if (self = [super init]) {
        self.alignment = SettingItemAlignmentRight;
        self.bgColor = [UIColor whiteColor];
        self.titleColor = [UIColor blackColor];
        self.titleFont = [UIFont systemFontOfSize:15.5f];
        self.subTitleColor = [UIColor grayColor];
        self.subTitleFont = [UIFont systemFontOfSize:15.0f];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.rightImageHeightOfCell = 0.72;
        self.middleImageHeightOfCell = 0.35;
    }
    return self;
}

+ (SettingItem *) createWithTitle:(NSString *)title
{
    return [SettingItem createWithImageName:nil title:title];
}

+ (SettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title
{
    return [SettingItem createWithImageName:imageName title:title subTitle:nil rightImageName:nil];
}

+ (SettingItem *) createWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    return [SettingItem createWithImageName:nil title:title subTitle:subTitle rightImageName:nil];
}

+ (SettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle
{
    return [SettingItem createWithImageName:imageName title:title middleImageName:middleImageName subTitle:subTitle rightImageName:nil];
}

+ (SettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName
{
    return [SettingItem createWithImageName:imageName title:title middleImageName:nil subTitle:subTitle rightImageName:rightImageName];
}

+ (SettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName
{
    SettingItem *item = [[SettingItem alloc]init];
    item.imageName = imageName;
    item.middleImageName = middleImageName;
    item.rightImageName = rightImageName;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}

-(void)setAlignment:(SettingItemAlignment)alignment
{
    _alignment = alignment;
    if (alignment == SettingItemAlignmentMiddle) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

-(void)setType:(SettingItemType)type
{
    _type = type;
    if (type == SettingItemTypeSwitch) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if(type == SettingItemTypeButton){
        self.btnBGColor = DEFAULT_GREEN_COLOR;
        self.btnTitleColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bgColor = [UIColor clearColor];
    
    }

}


@end

@implementation SettingGrounp

-(id)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(SettingItem *)firstObj, ...

{
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc]init];
        va_list argList;
        if (firstObj) {
            [_items addObject:firstObj];
            va_start(argList, firstObj);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
        }
    }
    return self;
}

- (SettingItem *) itemAtIndex:(NSUInteger)index
{
    return [_items objectAtIndex:index];
}

- (NSUInteger) indexOfItem:(SettingItem *)item
{
    return [_items indexOfObject:item];
}

- (NSUInteger) itemsCount
{
    return self.items.count;
}
@end
