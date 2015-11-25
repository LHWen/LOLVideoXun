//
//  ScrollDisplayViewController.h
//  BaseProject
//
//  Created by apple-jd26 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
//使用网络图片，需要引入SDWebImage，请到下面网址下载
//http://github.com/rs/SDWebImage

#pragma  mark - 协议
@class ScrollDisplayViewController;

@protocol ScrollDisplayViewControllerDelegate <NSObject>

@optional
//第一项将自身回传（没什么用，系统写法），第二个参才是回传的参数
//当用户点击某页时触发
- (void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index;
//实时回传当前索引值，手动滑动页面
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIndex:(NSInteger)index;

@end



@interface ScrollDisplayViewController : UIViewController
{
    NSTimer *_timer;
}

//传入图片地址数组
- (instancetype)initWithImgPaths:(NSArray *)paths;
//传入图片名字数组
- (instancetype)initWithImgNames:(NSArray *)names;
//传入视图控制器
- (instancetype)initWithControllers:(NSArray *)controllers;
//定义代理的属性，用weak修饰
@property (nonatomic, weak) id<ScrollDisplayViewControllerDelegate>delegate;

//用于保存进来的数组属性，只读
@property (nonatomic,readonly)NSArray *paths;
@property (nonatomic,readonly)NSArray *names;
@property (nonatomic,readonly)NSArray *controllers;
//用于展示滚动视图
@property (nonatomic,readonly)UIPageViewController *pageVC;
//展示小圆点
@property (nonatomic,readonly)UIPageControl *pageControl;

//设置是否循环滚动，默认YES，表示可循环
@property (nonatomic,assign)BOOL canCycle;
//设置是否定时滚动,默认YES，表示定时滚动
@property (nonatomic,assign)BOOL autoCycle;
//滚动时间间隔，默认3秒
@property (nonatomic,assign)NSTimeInterval duration;
//是否设置页数提示，默认YES，显示
@property (nonatomic,assign)BOOL showPageControl;
//当前页数
@property (nonatomic,assign)NSInteger currentPage;
//设置页数提示的垂直偏移量，正数表示向下移动
@property (nonatomic,assign)CGFloat pageControlOffset;

@end
