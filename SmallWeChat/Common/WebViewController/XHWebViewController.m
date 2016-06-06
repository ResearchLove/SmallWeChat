//
//  WebViewController.m
//  SmallWeChat
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "XHWebViewController.h"
#import "UIView+Frame.h"
#import "MBProgressHUD.h"

@interface XHWebViewController ()<UIWebViewDelegate>

@end

@implementation XHWebViewController

- (id) init
{
    if (self = [super init]) {
        _webView = [[UIWebView alloc] init];
        [_webView setDelegate:self];
        [_webView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_webView];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_webView setFrame:CGRectMake(0, 0, self.view.frameWidth, self.view.frameHeight)];
}

- (void) setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.webView animated:YES];
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [self.navigationItem setTitle:title];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.webView animated:YES];
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
