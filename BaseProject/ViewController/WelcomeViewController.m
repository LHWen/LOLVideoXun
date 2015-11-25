//
//  WelcomeViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "iCarousel.h"
#import "FBShimmeringView.h"

@interface WelcomeViewController ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic, strong)iCarousel *ic;
/** 储存图片名称 */
@property (nonatomic, strong)NSArray *imageNames;
@end

@implementation WelcomeViewController

- (NSArray *)imageNames{
    if (!_imageNames) {
        /** 读取HeroSkins.bundle 文件夹内所有文件名 */
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HeroSkins.bundle" ofType:nil];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        _imageNames = [fileManager subpathsAtPath:path];
    }
    return _imageNames;
}

- (iCarousel *)ic {
    if (!_ic) {
        _ic = [iCarousel new];
        /** 就是仿写CollectionView */
        _ic.delegate = self;
        _ic.dataSource = self;
        /** 修改3D显示模式，type是枚举型的，数值0~11 */
        _ic.type = 3;
        /** 自动展示，0表示不滚动 越大滚动越快 */
        _ic.autoscroll = 1;
        /** 改为竖向展示 */
//        _ic.vertical = NO;
        /** 改为翻页模式 */
//        _ic.pagingEnabled = NO;
        /** 滚动速度 */
//        _ic.scrollSpeed = 1;
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.view addSubview:self.ic];
        [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-120);
        }];

        /** 自动滚动 */
        //    [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
        //        [self.ic scrollToItemAtIndex:self.ic.currentItemIndex + 1 animated:YES];
        //    } repeats:YES];

   [self areaControlGlimmer];
    
    
}

- (void)areaControlGlimmer{
    /** 创建点击事件，点击后进入主页面 */
    UIButton *intoMain = [[UIButton alloc] init];
    /** 若使控件添加到视图，必须是先添加后再设置约束 */
    //     [self.view addSubview:intoMain];
    //    intoMain.backgroundColor = [UIColor yellowColor];
    /** 添加字 */
    [intoMain setTitle:@"点击此处Going" forState:UIControlStateNormal];
    intoMain.titleLabel.font = [UIFont systemFontOfSize:20];
    //    [intoMain setBackgroundColor:[UIColor redColor]];
    [intoMain setTintColor:[UIColor redColor]];
    [intoMain addTarget:self action:@selector(intoAppMain) forControlEvents:UIControlEventTouchUpInside];
    
    /** 闪烁 */
    /** 建立闪烁区域 */
    FBShimmeringView *sv = [FBShimmeringView new];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(270, 35));
        make.bottom.mas_equalTo(-50);
    }];
    /** 将按钮放入闪烁区域，必须以下写法 */
    sv.contentView = intoMain;
    [intoMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    /** 开启闪烁效果 */
//        sv.shimmering = YES;

}
/** 实现跳转的方法 */
- (void)intoAppMain{
    UITabBarController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
    [self presentViewController:mainVC animated:YES completion:nil];
}

#pragma mark - iCarouser
/** 添加循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES; /** type 0 的默认循环滚动模式是 否 */
    }
    /** 修改缝隙 */
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    /** 取消后背的显示 */
    if (option == iCarouselOptionShowBackfaces) {
        /** 不取消 */
        return YES;
    }
    return value;
}

/** 问有多少个Cell */
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imageNames.count;
}
/** 问每一个Cell怎么样 */
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        /** 这里x,y是没有用得，图片的宽高 300 * 500 */
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW / 2, kWindowH / 2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    /** imageNames数组中存得时图片名，因为图片是JPG形式，只能用路径来读取 */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HeroSkins" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    return  view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"选择了第%ld张",index);
}

@end
