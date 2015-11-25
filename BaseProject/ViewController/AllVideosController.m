//
//  AllVideosController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AllVideosController.h"
#import "VideosViewController.h"
#import "ScrollDisplayViewController.h"

@interface AllVideosController ()<ScrollDisplayViewControllerDelegate>
/** 加载在容器里，左右分页的 */
@property(nonatomic,strong) ScrollDisplayViewController *sdVC;
/** 放按钮的滚动视图 */
@property(nonatomic,strong) UIScrollView *scrollView;
/** 可变数组，存放头部按钮 */
@property(nonatomic,strong) NSMutableArray *btns;
/** 线 */
@property(nonatomic,strong) UIView *lineView;
/**  用于保存当前选中的按钮  */
@property(nonatomic,strong) UIButton *currentBtn;
@property (nonatomic, strong)VideosViewController *vc;
@end

@implementation AllVideosController

//VideosViewController *vc = nil;(会编译出错)
/** 快捷的返回一个视图 */
- (VideosViewController *)videsVCWithType:(AllVideosListType)type{
    /** 主视图 */
    self.vc = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"VideosViewController"];
    self.vc.type = type;
    return self.vc;
}

- (ScrollDisplayViewController *)sdVC{
    if (!_sdVC) {
        NSArray *Allvc = @[
                           [self videsVCWithType:AllVideosListTypeJieShuo],
                           [self videsVCWithType:AllVideosListTypeYuLe],
                           [self videsVCWithType:AllVideosListTypeSaiShi]
                           ];
        _sdVC = [[ScrollDisplayViewController alloc] initWithControllers:Allvc];
        
        _sdVC.autoCycle = NO;
        _sdVC.showPageControl = NO;
        /** 关掉了点击按钮的循环 */
        _sdVC.canCycle = NO;
        _sdVC.delegate = self;
    }
    return _sdVC;
}

#pragma  mark - 可变数组的懒加载btns
- (NSMutableArray *)btns{
    if (!_btns) {
        _btns = [NSMutableArray new];
    }
    return _btns;
}

/** 线条 */
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = kRGBColor(72, 134, 246);
    }
    return _lineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:self.sdVC];
    [self.view addSubview:self.sdVC.view];
    [self.sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    /** 添加在navigationController.navigationBar 上面 */
    [self.navigationController.navigationBar addSubview:self.scrollView];
    //[self.view addSubview:self.scrollView];
    //    [self.view addSubview:self.scrollView];
    //    [self.navigationController.view insertSubview:self.scrollView belowSubview:self.navigationController.navigationBar];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
}

#pragma mark - 头部按钮
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
//        _scrollView.frame = CGRectMake(0, 67, self.view.bounds.size.width, 20);
        
        NSArray *arr = @[@"解说", @"娱乐", @"赛事"];
        /** 指向最新添加的按钮 */
        UIView *latesView = nil;
        /** 通过for循环添加按钮 */
        for (int i = 0; i < arr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:0];
            [btn setTitle:arr[i] forState:0];
            [btn setBackgroundColor:kRGBColor(59, 59, 59)];
            //文字颜色（正常）
            [btn setTitleColor:kRGBColor(185, 199, 224) forState:0];
            //文字颜色（选中）
            [btn setTitleColor:kRGBColor(72, 134, 246) forState:UIControlStateSelected];
            if (i == 0) {
                _currentBtn = btn;
                btn.selected = YES;
            }
            [btn bk_addEventHandler:^(UIButton *sender) {
                /** 如果当前是点击状态，什么都不做，否者就取消之前的按钮状态 */
                if (_currentBtn != sender) {
                    /** 去掉之前按钮的点击状态 */
                    _currentBtn.selected = NO;
                    /** 将当前按钮改为点击状态 */
                    sender.selected = YES;
                    _currentBtn =sender;
                    
                    /** 设置线条 */
                    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.view.bounds.size.width/3.0);
                        make.height.mas_equalTo(2);
                        make.centerX.mas_equalTo(sender);
                        make.top.mas_equalTo(sender.mas_bottom).mas_equalTo(-2);
                    }];
                    /** 获取当前按钮的索引值 */
                    _sdVC.currentPage = [_btns indexOfObject:sender];
                }
            } forControlEvents:UIControlEventTouchUpInside];
            /** 将头部视图添加到按钮的滚动视图 */
            [_scrollView addSubview:btn];
            /** 按钮布局 */
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width/3.0, 44));
                make.centerY.mas_equalTo(_scrollView);
                if (latesView) {
                    make.left.mas_equalTo(latesView.mas_right).mas_equalTo(0);
                }else{
                    make.left.mas_equalTo(0);
                }
            }];
            latesView = btn;
            /** 将按钮添加到数组 */
            [self.btns addObject:btn];
        }
        /** lastView肯定是最后一个按钮，最后一个按钮的x轴 肯定是固定的，当我们设置按钮的右边缘距离父视图ContentView的右边缘 0像素
        那么滚动视图的内容区域就会被锁定了 */
        [latesView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_scrollView.mas_right).mas_equalTo(0);
        }];
        /** 隐藏滚动视图中的滚动条 */
        _scrollView.showsHorizontalScrollIndicator = NO;
        /** 如果有线存在，就添加线的约束 */
        [_scrollView addSubview:self.lineView];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.view.bounds.size.width/3);
            make.height.mas_equalTo(2);
            UIButton *btn=_btns[0];
            make.centerX.mas_equalTo(btn);
            make.top.mas_equalTo(btn.mas_bottom).mas_equalTo(-2);
        }];



    }
    return _scrollView;
}

#pragma  mark - 切到下一页或者切回来隐藏掉按钮
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.scrollView.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.scrollView.hidden = YES;
}



-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIndex:(NSInteger)index{
    _currentBtn.selected = NO;
    _currentBtn = _btns[index];
    _currentBtn.selected = YES;
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.bounds.size.width/3);
        make.height.mas_equalTo(2);
        make.centerX.mas_equalTo(_currentBtn);
        make.top.mas_equalTo(_currentBtn.mas_bottom).mas_equalTo(-2);
    }];
    
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
