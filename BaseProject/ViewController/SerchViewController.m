//
//  SerchViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SerchViewController.h"
#import "SearchDetailViewController.h"

@interface SerchViewController ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)NSURLRequest *requst;
@end

@implementation SerchViewController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [self.view addSubview:_webView];
        _webView.delegate = self;
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

#pragma mark - UIWebViewDelegate
/** 如果返回NO，则不会加载请求 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    /** 点击web中任意一项跳转到下一页 */
    /** 如果当前webView加载的请求，不是当前页面的 */
    NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"];
    if (![request.URL.absoluteString isEqualToString:path]) {
        SearchDetailViewController *vc = [[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        self.requst = request;
        return NO;
    }
    
    return YES;

}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
