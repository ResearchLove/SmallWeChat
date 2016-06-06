//
//  UIHelper.m
//  SmallWeChat
//
//  Created by apple on 16/1/10.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

+ (SettingGrounp *) getFriensListItemGroup
{
    SettingItem *notify = [SettingItem createWithImageName:@"plugins_FriendNotify" title:@"新的朋友"];
    SettingItem *friendGroup = [SettingItem createWithImageName:@"add_friend_icon_addgroup" title:@"群聊"];
    SettingItem *tag = [SettingItem createWithImageName:@"Contact_icon_ContactTag" title:@"标签"];
    SettingItem *offical = [SettingItem createWithImageName:@"add_friend_icon_offical" title:@"公众号"];
    SettingGrounp *group = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:notify, friendGroup, tag, offical, nil];
    return group;
}

+ (NSMutableArray *) getMineVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SettingItem *album = [SettingItem createWithImageName:@"MoreMyAlbum" title:@"相册"];
    SettingItem *favorite = [SettingItem createWithImageName:@"MoreMyFavorites" title:@"收藏"];
    SettingItem *bank = [SettingItem createWithImageName:@"MoreMyBankCard" title:@"钱包"];
    SettingItem *card = [SettingItem createWithImageName:@"MyCardPackageIcon" title:@"卡包"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:group1];
    
    SettingItem *expression = [SettingItem createWithImageName:@"MoreExpressionShops" title:@"表情"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:group2];
    
    SettingItem *setting = [SettingItem createWithImageName:@"MoreSetting" title:@"设置"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group3];
    return items;
}

+ (NSMutableArray *) getDiscoverItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SettingItem *friendsAlbum = [SettingItem createWithImageName:@"ff_IconShowAlbum" title:@"朋友圈" subTitle:nil rightImageName:@"2.jpg"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:friendsAlbum, nil];
    [items addObject:group1];
    
    SettingItem *qrCode = [SettingItem createWithImageName:@"ff_IconQRCode" title:@"扫一扫"];
    SettingItem *shake = [SettingItem createWithImageName:@"ff_IconShake" title:@"摇一摇"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:qrCode, shake, nil];
    [items addObject:group2];
    
    SettingItem *loacation = [SettingItem createWithImageName:@"ff_IconLocationService" title:@"附近的人" subTitle:nil rightImageName:@"FootStep"];
    loacation.rightImageHeightOfCell = 0.43;
    SettingItem *bottle = [SettingItem createWithImageName:@"ff_IconBottle" title:@"漂流瓶"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:loacation, bottle, nil];
    [items addObject:group3];
    
    SettingItem *shopping = [SettingItem createWithImageName:@"CreditCard_ShoppingBag" title:@"购物"];
    SettingItem *game = [SettingItem createWithImageName:@"MoreGame" title:@"游戏" subTitle:@"超火力新枪战" rightImageName:@"game_tag_icon"];
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:shopping, game, nil];
    [items addObject:group4];
    
    return items;
}

+ (NSMutableArray *) getDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SettingItem *tag = [SettingItem createWithTitle:@"设置备注和标签"];
    SettingItem *phone = [SettingItem createWithTitle:@"电话号码" subTitle:@"18888888888"];
    phone.alignment = SettingItemAlignmentLeft;
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, phone, nil];
    [items addObject:group1];
    SettingItem *position = [SettingItem createWithTitle:@"地区" subTitle:@"山东 青岛"];
    position.alignment = SettingItemAlignmentLeft;
    SettingItem *album = [SettingItem createWithTitle:@"个人相册"];
    album.subImages = @[@"1.jpg", @"2.jpg", @"8.jpg", @"0.jpg"];
    album.alignment = SettingItemAlignmentLeft;
    SettingItem *more = [SettingItem createWithTitle:@"更多"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:position, album, more, nil];
    [items addObject:group2];
    
    SettingItem *chatButton = [SettingItem createWithTitle:@"发消息"];
    chatButton.type = SettingItemTypeButton;
    SettingItem *videoButton = [SettingItem createWithTitle:@"视频聊天"];
    videoButton.type = SettingItemTypeButton;
    videoButton.btnBGColor = [UIColor whiteColor];
    videoButton.btnTitleColor = [UIColor blackColor];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:chatButton, videoButton, nil];
    [items addObject:group3];
    
    return items;
}

+ (NSMutableArray *) getMineDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SettingItem *avatar = [SettingItem createWithImageName:nil title:@"头像" subTitle:nil rightImageName:@"0.jpg"];
    SettingItem *name = [SettingItem createWithTitle:@"名字" subTitle:@"Bay、栢"];
    SettingItem *num = [SettingItem createWithTitle:@"微信号" subTitle:@"li-bokun"];
    SettingItem *code = [SettingItem createWithTitle:@"我的二维码"];
    SettingItem *address = [SettingItem createWithTitle:@"我的地址"];
    SettingGrounp *frist = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:avatar, name, num, code, address, nil];
    [items addObject:frist];
    
    SettingItem *sex = [SettingItem createWithTitle:@"性别" subTitle:@"男"];
    SettingItem *pos = [SettingItem createWithTitle:@"地址" subTitle:@"山东 滨州"];
    SettingItem *proverbs = [SettingItem createWithTitle:@"个性签名" subTitle:@"Hello world!"];
    SettingGrounp *second = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:sex, pos, proverbs, nil];
    [items addObject:second];
    
    return items;
}

+ (NSMutableArray *) getSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SettingItem *safe = [SettingItem createWithImageName:nil title:@"账号和安全" middleImageName:@"ProfileLockOn" subTitle:@"已保护"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:safe, nil];
    [items addObject:group1];
    
    SettingItem *noti = [SettingItem createWithTitle:@"新消息通知"];
    SettingItem *privacy = [SettingItem createWithTitle:@"隐私"];
    SettingItem *normal = [SettingItem createWithTitle:@"通用"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:noti, privacy, normal, nil];
    [items addObject:group2];
    
    SettingItem *feedBack = [SettingItem createWithTitle:@"帮助与反馈"];
    SettingItem *about = [SettingItem createWithTitle:@"关于微信"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:feedBack, about, nil];
    [items addObject:group3];
    
    SettingItem *exit = [SettingItem createWithTitle:@"退出登陆"];
    [exit setAlignment:SettingItemAlignmentMiddle];
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:exit, nil];
    [items addObject:group4];
    
    return items;
}

+ (NSMutableArray *) getDetailSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    SettingItem *tag = [SettingItem createWithTitle:@"设置备注及标签"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, nil];
    [items addObject:group1];
    
    SettingItem *recommend = [SettingItem createWithTitle:@"把他推荐给好友"];
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:recommend, nil];
    [items addObject:group2];
    
    SettingItem *starFriend = [SettingItem createWithTitle:@"把它设为星标朋友"];
    starFriend.type = SettingItemTypeSwitch;
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:starFriend, nil];
    [items addObject:group3];
    
    SettingItem *prohibit = [SettingItem createWithTitle:@"不让他看我的朋友圈"];
    prohibit.type = SettingItemTypeSwitch;
    SettingItem *ignore = [SettingItem createWithTitle:@"不看他的朋友圈"];
    ignore.type = SettingItemTypeSwitch;
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:prohibit, ignore, nil];
    [items addObject:group4];
    
    SettingItem *addBlacklist = [SettingItem createWithTitle:@"加入黑名单"];
    addBlacklist.type = SettingItemTypeSwitch;
    SettingItem *report = [SettingItem createWithTitle: @"举报"];
    SettingGrounp *group5 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:addBlacklist, report, nil];
    [items addObject:group5];
    
    SettingItem *delete = [SettingItem createWithTitle:@"删除好友"];
    delete.type = SettingItemTypeButton;
    SettingGrounp *group6 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:delete, nil];
    [items addObject:group6];
    
    return items;
}

+ (NSMutableArray *) getNewNotiVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    SettingItem *recNoti = [SettingItem createWithTitle:@"接受新消息通知" subTitle:@"已开启"];
    SettingGrounp *group1 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"如果你要关闭或开启微信的新消息通知，请在iPhone的“设置” - “通知”功能中，找到应用程序“微信”更改。" settingItems:recNoti, nil];
    [items addObject:group1];
    
    SettingItem *showDetail = [SettingItem createWithTitle:@"通知显示详情信息"];
    showDetail.type = SettingItemTypeSwitch;
    SettingGrounp *group2 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要。" settingItems:showDetail, nil];
    [items addObject:group2];
    
    SettingItem *disturb = [SettingItem createWithTitle:@"功能消息免打扰"];
    SettingGrounp *group3 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"设置系统功能消息提示声音和振动时段。" settingItems:disturb, nil];
    [items addObject:group3];
    
    SettingItem *voice = [SettingItem createWithTitle:@"声音"];
    voice.type = SettingItemTypeSwitch;
    SettingItem *shake = [SettingItem createWithTitle:@"震动"];
    shake.type = SettingItemTypeSwitch;
    SettingGrounp *group4 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"当微信在运行时，你可以设置是否需要声音或者振动。" settingItems:voice, shake, nil];
    [items addObject:group4];
    
    SettingItem *friends = [SettingItem createWithTitle:@"朋友圈照片更新"];
    friends.type = SettingItemTypeSwitch;
    SettingGrounp *group5 = [[SettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。" settingItems:friends, nil];
    [items addObject:group5];
    
    return items;
}



@end
