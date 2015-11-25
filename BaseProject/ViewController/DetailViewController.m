//
//  DetailViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, strong)NSNumber *ID;

@end

@implementation DetailViewController

- (id)initWithID:(NSNumber *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView=[UIWebView new];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    NSString *path=[NSString stringWithFormat:@"http://lol.zhangyoubao.com/mobiles/item/%@?v_=400606&token=9106edd4bac1f8ab738adc3a17630480839b&user_id=13360447&size=middle&t=1446430870", _ID];
    NSURL *url=[NSURL URLWithString:path];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

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
