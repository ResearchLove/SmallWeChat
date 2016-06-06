//
//  ChatBoxViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "ChatBoxViewController.h"
#import "ChatBox.h"
#import "ChatBoxMoreView.h"
#import "ChatBoxFaceView.h"
#import "UIView+Frame.h"

@interface ChatBoxViewController ()<ChatBoxDelegate,ChatBoxFaceViewDelegate,ChatBoxMoreViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,assign) CGRect keyboardFrame;
@property (nonatomic,strong) ChatBox *chatBox;
@property (nonatomic,strong) ChatBoxMoreView *chatBoxMoreView;
@property (nonatomic,strong) ChatBoxFaceView *chatBoxFaceView;

@end

@implementation ChatBoxViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.chatBox];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    // Do any additional setup after loading the view.
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self resignFirstResponder];

}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma  mark - Public Methods
-(BOOL)resignFirstResponder
{
    if (self.chatBox.status != ChatBoxStatusNothing && self.chatBox.status != ChatBoxStatusShowVoice) {
        [self.chatBox resignFirstResponder];
        self.chatBox.status = (self.chatBox.status == ChatBoxStatusShowVoice ? self.chatBox.status : ChatBoxStatusNothing);
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
            [UIView animateWithDuration:0.3 animations:^{
                [_delegate chatBoxViewController:self didChangaeChatBoxHeight:self.chatBox.curHeight];
            }completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
            }];
        }
        
    }
    return [super resignFirstResponder];
}

-(void)chatBox:(ChatBox *)chatBox sendTextMessage:(NSString *)textMessage
{
    MessageModel *messageModel = [[MessageModel alloc]init];
    messageModel.messageType = MessageTypeText;
    messageModel.ownerType = MessageOwnerTypeSelf;
    messageModel.text = textMessage;
    messageModel.date = [NSDate date];
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController: sendMessage:)]) {
        [_delegate chatBoxViewController:self sendMessage:messageModel];
    }
}

-(void)chatBox:(ChatBox *)chatBox changeChatBoxHeight:(CGFloat)height
{
    self.chatBoxFaceView.originY = height;
    self.chatBoxMoreView.originY = height;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
        float h = (self.chatBox.status == ChatBoxStatusShowFace ? HEIGHT_CHATBOXVIEW : self.keyboardFrame.size.height ) + height;
        [_delegate chatBoxViewController:self didChangaeChatBoxHeight:h];
    }
}

- (void) chatBox:(ChatBox *)chatBox changeStatusForm:(ChatBoxStatus)fromStatus to:(ChatBoxStatus)toStatus
{
    if (toStatus == ChatBoxStatusShowKeyboard) {      // 显示键盘
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.chatBoxFaceView removeFromSuperview];
            [self.chatBoxMoreView removeFromSuperview];
        });
        return;
    }else if (toStatus == ChatBoxStatusShowVoice) {    // 显示语音输入按钮
        // 从显示更多或表情状态 到 显示语音状态需要动画
        if (fromStatus == ChatBoxStatusShowMore || fromStatus == ChatBoxStatusShowFace) {
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangaeChatBoxHeight:HEIGHT_TABBAR];
                }
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
            }];
        }else {
            [UIView animateWithDuration:0.1 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangaeChatBoxHeight:HEIGHT_TABBAR];
                }

            }];
        }
    }else if (toStatus == ChatBoxStatusShowFace) {     // 显示表情面板
        if (fromStatus == ChatBoxStatusShowVoice || fromStatus == ChatBoxStatusNothing) {
            [self.chatBoxFaceView setOriginY:self.chatBox.curHeight];
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangaeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                }
            }];
        }else {
            // 表情高度变化
            self.chatBoxFaceView.originY = self.chatBox.curHeight + HEIGHT_CHATBOXVIEW;
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxFaceView.originY = self.chatBox.curHeight;
            } completion:^(BOOL finished) {
                [self.chatBoxMoreView removeFromSuperview];
            }];
            // 整个界面高度变化
            if (fromStatus != ChatBoxStatusShowMore) {
                [UIView animateWithDuration:0.2 animations:^{
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangaeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                    }
                }];
            }
        }
    }else if (toStatus == ChatBoxStatusShowMore) {// 显示更多面板
        if (fromStatus == ChatBoxStatusShowVoice || fromStatus == ChatBoxStatusNothing) {
            [self.chatBoxMoreView setOriginY:self.chatBox.curHeight];
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangaeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                }
            }];
        }else {
            self.chatBoxMoreView.originY = self.chatBox.curHeight + HEIGHT_CHATBOXVIEW;
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxMoreView.originY = self.chatBox.curHeight;
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
            }];
            
            if (fromStatus != ChatBoxStatusShowFace) {
                [UIView animateWithDuration:0.2 animations:^{
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangaeChatBoxHeight:self.chatBox.curHeight + HEIGHT_CHATBOXVIEW];
                    }
                }];
            }
        }
    }
}

#pragma mark - TLChatBoxFaceViewDelegate
- (void) chatBoxFaceViewDidSelectedFace:(FaceModel *)face type:(FaceType)type
{
    if (type == FaceTypeEmoji) {
        [self.chatBox addEmojiFace:face];
    }
}

- (void) chatBoxFaceViewDeleteButtonDown
{
    [self.chatBox deleteButtonDown];
}

- (void) chatBoxFaceViewSendButtonDown
{
    [self.chatBox sendCurrentMessage];
}

#pragma mark - TLChatBoxMoreViewDelegate
- (void) chatBoxMoreView:(ChatBoxMoreView *)chatBoxMoreView didSelectItem:(ChatBoxItem)itemType
{
    if (itemType == ChatBoxItemAlbum) {            // 相册
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imagePicker setDelegate:self];
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }
    else if (itemType == ChatBoxItemCamera) {       // 拍摄
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];//初始化
            [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            [imagePicker setDelegate:self];
            [self presentViewController:imagePicker animated:YES completion:^{
                
            }];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前设备不支持拍照。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"Did Selected Index Of ChatBoxMoreView: %d", (int)itemType] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSString *imageName = [NSString stringWithFormat:@"%lf", [[NSDate date]timeIntervalSince1970]];
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", PATH_CHATREC_IMAGE, imageName];
    NSData *imageData = (UIImagePNGRepresentation(image) == nil ? UIImageJPEGRepresentation(image, 1) : UIImagePNGRepresentation(image));
    [[NSFileManager defaultManager] createFileAtPath:imagePath contents:imageData attributes:nil];
    
    MessageModel *messageModel = [[MessageModel alloc] init];
    messageModel.messageType = MessageTypeImage;
    messageModel.ownerType = MessageOwnerTypeSelf;
    messageModel.date = [NSDate date];
    messageModel.imagePath = imageName;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:sendMessage:)]) {
        [_delegate chatBoxViewController:self sendMessage:messageModel];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Private Methods
- (void)keyboardWillHide:(NSNotification *)notification{
    self.keyboardFrame = CGRectZero;
    if (_chatBox.status == ChatBoxStatusShowFace || _chatBox.status == ChatBoxStatusShowMore) {
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangaeChatBoxHeight:self.chatBox.curHeight];
    }
}

- (void)keyboardFrameWillChange:(NSNotification *)notification{
    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (_chatBox.status == ChatBoxStatusShowKeyboard && self.keyboardFrame.size.height <= HEIGHT_CHATBOXVIEW) {
        return;
    }
    else if ((_chatBox.status == ChatBoxStatusShowFace || _chatBox.status == ChatBoxStatusShowMore) && self.keyboardFrame.size.height <= HEIGHT_CHATBOXVIEW) {
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangaeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangaeChatBoxHeight: self.keyboardFrame.size.height + self.chatBox.curHeight];
    }
} 

#pragma mark - Getter
- (ChatBox *) chatBox
{
    if (_chatBox == nil) {
        _chatBox = [[ChatBox alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_TABBAR)];
        [_chatBox setDelegate:self];
    }
    return _chatBox;
}

- (ChatBoxMoreView *) chatBoxMoreView
{
    if (_chatBoxMoreView == nil) {
        _chatBoxMoreView = [[ChatBoxMoreView alloc] initWithFrame:CGRectMake(0, HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_CHATBOXVIEW)];
        [_chatBoxMoreView setDelegate:self];
        
        ChatBoxMoreItem *photosItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"照片"
                                                                                imageName:@"sharemore_pic"];
        ChatBoxMoreItem *takePictureItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"拍摄"
                                                                                     imageName:@"sharemore_video"];
        ChatBoxMoreItem *videoItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"小视频"
                                                                               imageName:@"sharemore_sight"];
        ChatBoxMoreItem *videoCallItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"视频聊天"
                                                                                   imageName:@"sharemore_videovoip"];
        ChatBoxMoreItem *giftItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"红包"
                                                                              imageName:@"sharemore_wallet"];
        ChatBoxMoreItem *transferItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"转账"
                                                                                  imageName:@"sharemorePay"];
        ChatBoxMoreItem *positionItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"位置"
                                                                                  imageName:@"sharemore_location"];
        ChatBoxMoreItem *favoriteItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"收藏"
                                                                                  imageName:@"sharemore_myfav"];
        ChatBoxMoreItem *businessCardItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"名片"
                                                                                      imageName:@"sharemore_friendcard" ];
        ChatBoxMoreItem *interphoneItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"实时对讲机"
                                                                                    imageName:@"sharemore_wxtalk" ];
        ChatBoxMoreItem *voiceItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"语音输入"
                                                                               imageName:@"sharemore_voiceinput"];
        ChatBoxMoreItem *cardsItem = [ChatBoxMoreItem createChatBoxMoreItemWithTitle:@"卡券"
                                                                               imageName:@"sharemore_wallet"];
        [_chatBoxMoreView setItems:[[NSMutableArray alloc] initWithObjects:photosItem, takePictureItem, videoItem, videoCallItem, giftItem, transferItem, positionItem, favoriteItem, businessCardItem, interphoneItem, voiceItem, cardsItem, nil]];
    }
    return _chatBoxMoreView;
}


- (ChatBoxFaceView *) chatBoxFaceView
{
    if (_chatBoxFaceView == nil) {
        _chatBoxFaceView = [[ChatBoxFaceView alloc] initWithFrame:CGRectMake(0, HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_CHATBOXVIEW)];
        [_chatBoxFaceView setDelegate:self];
    }
    return _chatBoxFaceView;
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
