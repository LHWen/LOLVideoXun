//
//  ScrollDisplayViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ScrollDisplayViewController.h"
#import <UIButton+WebCache.h>

@interface ScrollDisplayViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@end

@implementation ScrollDisplayViewController
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //如果控制器数组为空，或者什么都没有
    if (!_controllers||_controllers.count == 0) {
        return;
    }
    _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:1 navigationOrientation:0 options:nil];
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    //需要使用pod引入Masonry第三方类库
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:0 animated:YES completion:nil];
    //关于小圆点
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = _controllers.count;
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        //中心点
        make.centerX.mas_equalTo(self.view);
        //距离下边缘是0
        make.bottom.mas_equalTo(0);
    }];
    //小圆点不能用户交互
    _pageControl.userInteractionEnabled = NO;
    
    self.autoCycle = _autoCycle;
    self.showPageControl = _showPageControl;
    self.pageControlOffset = _pageControlOffset;
}
//小圆点随着滚动视图一起滚动 操作原点位置
- (void)configPageControl{
    NSInteger index = [_controllers indexOfObject:_pageVC.viewControllers.firstObject];
    _pageControl.currentPage = index;
}

#pragma mark - 初始化方法
//传入图片地址数组
- (instancetype)initWithImgPaths:(NSArray *)paths{
    //路径中可能的类型， NSURL Http://  https://  本地路径file://
    //创建可变数组
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < paths.count; i++) {
        id path = paths[i];
        //UIImageView *imageView = [UIImageView new];
        //将图片设为可点击按钮（监控用户点击事件）
        UIButton *btn = [UIButton buttonWithType:0];
        if ([self isURL:paths]) {
//            [imageView sd_setImageWithURL:path];
            [btn sd_setBackgroundImageWithURL:path forState:0];
        }
        else if ([self isNetPath:path]) {
            NSURL *url = [NSURL URLWithString:path];
            [btn sd_setBackgroundImageWithURL:url forState:0];
//            [imageView sd_setImageWithURL:url];
        }
        else if ([path isKindOfClass:[NSString class]]){
            //本地地址，转URL
            NSURL *url = [NSURL fileURLWithPath:path];
            [btn sd_setBackgroundImageWithURL:url forState:0];
//            [imageView sd_setImageWithURL:url];
        }else{
            //此处可以设置一个裂开的本地图片
//            imageView.image = [UIImage imageNamed:@""];
        }
        UIViewController *vc = [UIViewController new];
//        vc.view = imageView;
        vc.view =btn;
        btn.tag = 1000+i;
        [btn bk_addEventHandler:^(UIButton *sender) {
            [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag - 1000];
        } forControlEvents:UIControlEventTouchUpInside];
        [arr addObject:vc];
    }
    self = [self initWithControllers:arr];
    return self;

}

- (BOOL)isURL:(id)path{
    return [path isKindOfClass:[NSURL class]];
}
- (BOOL)isNetPath:(id)path{
    //判断是否是网络途径
   // return [path isKindOfClass:[NSString class]]&&[path rangeOfString:@"http"].location!=NSNotFound&&[path rangeOfString:@"://"].location != NSNotFound;
    BOOL isStr = [path isKindOfClass:[NSString class]];
    if (!isStr) {
        return NO;
    }
    BOOL containHttp = [path rangeOfString:@"http"].location!=NSNotFound;
    BOOL containTile = [path rangeOfString:@"//"].location!=NSNotFound;
    return isStr && containHttp && containTile;
    
}
//传入图片名字数组
- (instancetype)initWithImgNames:(NSArray *)names{
    //图片名字->Image->ImageView->ViewController
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < names.count; i++) {
        UIImage *img = [UIImage imageNamed:names[i]];
        UIImageView *iv = [[UIImageView alloc]initWithImage:img];
        UIViewController *vc = [UIViewController new];
        vc.view = iv;
        //arr中放得都是UIViewController
        [arr addObject:vc];
    }
    self = [self initWithControllers:arr];
    return self;
}
//传入视图控制器
- (instancetype)initWithControllers:(NSArray *)controllers{
    if (self = [super init]) {
        //为了防止实参是可变的数组，需要复制一份出来以保证属性不会因可变数组在外部被修改，而导致随之修改
        _controllers = [controllers copy];
        //设置滚动视图属性
        _autoCycle = YES;
        _canCycle = YES;
        _showPageControl = YES;
        _duration = 2;
        _pageControlOffset = 0;
    }
    return self;
}

#pragma  mark - UIPageViewController
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == 0) {
        return _canCycle?_controllers.lastObject:nil;
    }
    return _controllers[index - 1];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == _controllers.count - 1) {
        return _canCycle?_controllers.lastObject:nil;
    }
    return _controllers[index + 1];
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    if (completed && finished) {
        [self configPageControl];
        NSInteger index = [_controllers indexOfObject:pageViewController.viewControllers.firstObject];
        //respondsToSelector 可以判断某对象是否含有某个方法
        if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:currentIndex:)]) {
            [self.delegate scrollDisplayViewController:self currentIndex:index];
        }
    }
}

#pragma mark - 属性的set方法
- (void)setAutoCycle:(BOOL)autoCycle{
    _autoCycle = autoCycle;
    //停掉timer
    [_timer invalidate];
    if (!autoCycle) {
        //如果当前传入的为No,即循环直接返回
        return;
    }
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
//新建视图
        UIViewController *vc = _pageVC.viewControllers.firstObject;
        NSInteger index = [_controllers indexOfObject:vc];
        UIViewController *nextVC = nil;
        //如果是最后一张图
        if (index == _controllers.count - 1) {
            //如果不滚动
            if (!_canCycle) {
                return ;
            }
            //返回第一张图
            nextVC = _controllers.firstObject;
        }else{//如果当前不是最后一张图，滚动到下一张
            nextVC = _controllers[index + 1];
        }
        __block ScrollDisplayViewController *vc1 = self;
        [_pageVC setViewControllers:@[nextVC] direction:0 animated:YES completion:^(BOOL finished) {
            [vc1 configPageControl];
        }];
    } repeats:YES];
    
}

- (void)setShowPageControl:(BOOL)showPageControl{
    _showPageControl = showPageControl;
    _pageControl.hidden = !showPageControl;
}

- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    //如果为真，则重新调用方法，停掉原来的timer
    self.autoCycle = _autoCycle;
}

- (void)setPageControlOffset:(CGFloat)pageControlOffset{
    _pageControlOffset = pageControlOffset;
    //更新页面数量控件bottom约束
    [_pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_pageControlOffset);
    }];
}

- (void)setCurrentPage:(NSInteger)currentPage{
    /*设置新的显示页面，情况有三种
     情况一：新页面和老页面是同一个，什么都不做
     情况二：新页面在老页面的右侧，动画效果应该向右滚动
     情况三：新页面在老页面的左侧，动画效果应该向左滚动
     
     UIPageViewControllerNavigationDirectionForward,向右
     UIPageViewControllerNavigationDirectionReverse,向左
     */
    NSInteger direction = 0;
    if (_currentPage == currentPage) {
        return;
    }else if (_currentPage > currentPage){
        direction = 1;
    }else{
        direction = 0;
    }
    //得到索引值  跳转当前视图
    _currentPage = currentPage;
    UIViewController *vc = _controllers[currentPage];
    [_pageVC setViewControllers:@[vc] direction:direction animated:YES completion:nil];
}

@end
