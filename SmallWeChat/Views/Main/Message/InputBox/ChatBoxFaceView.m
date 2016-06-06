//
//  ChatBoxFaceView.m
//  SmallWeChat
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 HaoHe. All rights reserved.
//



#import "ChatBoxFaceView.h"
#import "ChatBoxFaceMenuView.h"
#import "ChatBoxFacePageView.h"
#import "FaceHelper.h"
#import "UIView+Frame.h"


#define     HEIGHT_BOTTOM_VIEW          36.0f

@interface ChatBoxFaceView () <ChatBoxFaceMenuViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) FaceGroupModel *curGroup;
@property (nonatomic,assign) int curPage;

@property (nonatomic,strong) UIView *topLine;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) ChatBoxFaceMenuView *faceMenuView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *facePageViewArray;
@end

@implementation ChatBoxFaceView

-(id)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:DEFAULT_CHATBOX_COLOR];
        [self addSubview:self.faceMenuView];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{

    [super setFrame:frame];
    [self.scrollView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - HEIGHT_BOTTOM_VIEW - 18)];
     [self.pageControl setFrame:CGRectMake(0, self.scrollView.frameHeight + 3, frame.size.width, 8)];
    for (ChatBoxFacePageView *pageView in self.facePageViewArray) {
        [self.scrollView addSubview:pageView];
    }
}

#pragma mark - ChatBoxFaceMenuViewDelegate
-(void)chatBoxFaceMenuView:(ChatBoxFaceMenuView *)chatBoxFaceMenuView didSelectedFaceMenuIndex:(NSInteger)index
{
    _curGroup = [[[FaceHelper sharedFaceHelper] faceGroupArray] objectAtIndex:index];
    if (_curGroup.facesArray == nil) {
        _curGroup.facesArray = [[FaceHelper sharedFaceHelper] getFaceArrayByGroupID:_curGroup.groupID];
    }
    [self reloadScrollView];
}

-(void)chatBoxFaceMenuViewSendButtonDown
{
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDeleteButtonDown)]) {
        [_delegate chatBoxFaceViewSendButtonDown];
    }
}

- (void) chatBoxFaceMenuViewAddButtonDown
{
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewSendButtonDown)]) {
        [_delegate chatBoxFaceViewSendButtonDown];
    }
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    int page = scrollView.contentOffset.x / self.frameWidth;
    if (page > _curPage && (page * WIDTH_SCREEN - scrollView.contentOffset.x < WIDTH_SCREEN * 0.2)) {//向右翻
        [self showFaceFageAtIndex:page];
    }else if (page < _curPage && (scrollView.contentOffset.x - page * WIDTH_SCREEN) < WIDTH_SCREEN * 0.2) {
        [self showFaceFageAtIndex:page];
    }


}

#pragma mark - Event Response
- (void) didSelectedFace:(UIButton *)sender
{
    if (sender.tag == -1) {
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDeleteButtonDown)]) {
            [_delegate chatBoxFaceViewDeleteButtonDown];
        }
    }else {
        FaceModel *faceModel = [_curGroup.facesArray objectAtIndex:sender.tag];
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDidSelectedFace:type:)]) {
            [_delegate chatBoxFaceViewDidSelectedFace:faceModel type:_curGroup.faceType];
        }
    }
}

- (void) pageControlClicked:(UIPageControl *)pageControl
{
    [self showFaceFageAtIndex:pageControl.currentPage];
    [self.scrollView scrollRectToVisible:CGRectMake(pageControl.currentPage * WIDTH_SCREEN, 0, WIDTH_SCREEN, self.scrollView.frameHeight) animated:YES];
}

#pragma mark - Private Methods
-(void)reloadScrollView
{
    
    int page = (int)(self.curGroup.facesArray.count / (self.curGroup.faceType == FaceTypeEmoji ? 20 : 8)) + (int)(self.curGroup.facesArray.count % (self.curGroup.faceType == FaceTypeEmoji ? 20 : 8));
    [self.pageControl setNumberOfPages:page];
    [self.scrollView setContentSize:CGSizeMake(WIDTH_SCREEN * page, self.scrollView.frameHeight)];
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, WIDTH_SCREEN, self.scrollView.frameHeight) animated:NO];
    _curPage = -1;
    [self showFaceFageAtIndex:0];

}

-(void)showFaceFageAtIndex:(NSUInteger)index
{

    if (index == _curPage) {
        return;
    }
    [self.pageControl setCurrentPage:index];
    int count = _curGroup.faceType == FaceTypeEmoji ? 20 : 8;
    if (_curPage == -1) {
        ChatBoxFacePageView *pageView1 = [self.facePageViewArray objectAtIndex:0];
        [pageView1 showFaceGroup:_curGroup formIndex:0 count:0];
        [pageView1 setOrigin:CGPointMake(-WIDTH_SCREEN, 0)];
        [pageView1 addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
        ChatBoxFacePageView *pageView2 = [self.facePageViewArray objectAtIndex:1];
        [pageView2 showFaceGroup:_curGroup formIndex:0 count:count];
        [pageView2 setOrigin:CGPointMake(0, 0)];
        [pageView2 addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
        ChatBoxFacePageView *pageView3 = [self.facePageViewArray objectAtIndex:2];
        [pageView3 showFaceGroup:_curGroup formIndex:count count:count];
        [pageView3 addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
        [pageView3 setOrigin:CGPointMake(WIDTH_SCREEN, 0)];

    }else{
        if (_curPage < index) {
            ChatBoxFacePageView *pageView1 = [self.facePageViewArray objectAtIndex:0];
            [pageView1 showFaceGroup:_curGroup formIndex:(int)(index + 1) * count count:count];
            [pageView1 setOrigin:CGPointMake((index + 1) * WIDTH_SCREEN, 0)];
            [self.facePageViewArray removeObjectAtIndex:0];
            [self.facePageViewArray addObject:pageView1];
        }else{
            ChatBoxFacePageView *pageView3 = [self.facePageViewArray objectAtIndex:2];
            [pageView3 showFaceGroup:_curGroup formIndex:(int)(index - 1) * count count:count];
            [pageView3 setOrigin:CGPointMake((index - 1) * WIDTH_SCREEN, 0)];
            [self.facePageViewArray removeObjectAtIndex:2];
            [self.facePageViewArray insertObject:pageView3 atIndex:0];
        
        }
    
    
    }
    _curPage = (int)index;
}

#pragma mark - Getter
-(UIView *)topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 0.5)];
        [_topLine setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
    }
    return _topLine;
}

-(ChatBoxFaceMenuView *)faceMenuView
{
    if (_faceMenuView == nil) {
        _faceMenuView = [[ChatBoxFaceMenuView alloc] initWithFrame:CGRectMake(0, self.frameHeight - HEIGHT_BOTTOM_VIEW, WIDTH_SCREEN, HEIGHT_BOTTOM_VIEW)];
        [_faceMenuView setDelegate:self];
        [_faceMenuView setFaceGroupArray:[[FaceHelper sharedFaceHelper] faceGroupArray]];
    }
    return _faceMenuView;

}

-(UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControl.pageIndicatorTintColor = DEFAULT_LINE_GRAY_COLOR;
        [_pageControl addTarget:self action:@selector(pageControlClicked:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

-(UIScrollView *)scrollView
{

    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]init];
        [_scrollView setScrollsToTop:NO];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
    }

    return _scrollView;
}

-(NSMutableArray *)facePageViewArray
{

    if (_facePageViewArray == nil) {
        _facePageViewArray = [[NSMutableArray alloc]initWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            ChatBoxFacePageView *view = [[ChatBoxFacePageView alloc]initWithFrame:self.scrollView.bounds];
            [_facePageViewArray addObject:view];
        }
    }
    return _facePageViewArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
