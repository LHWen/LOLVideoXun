//
//  LatesViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatesViewController.h"
#import "LatestViewModel.h"
#import "LatestCell.h"
#import "NoImgLatestCell.h"
#import "ScrollDisplayViewController.h"
#import "DetailViewController.h"

@interface LatesViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollDisplayViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)LatestViewModel *latesVM;
//每刷新一次就要重新创建一个scrollDisplayViewController
@property (nonatomic, strong)ScrollDisplayViewController *sdVC;
@end

@implementation LatesViewController

-(LatestViewModel *)latesVM{
    if (!_latesVM) {
        //不可使用new来创建，需要返回type
        _latesVM = [[LatestViewModel alloc] initWithZiXunType:_type];
    }
    return _latesVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.latesVM refreshDataCompletionHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }
            //添加头部
            [self configTableHeader];
        }];
        
    }];
    [_tableView.header beginRefreshing];
    
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.latesVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.description];
            }
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        }];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.latesVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    //修改域名,判断图片地址是否存在，使用两种cell来完成是否有图片
    if ([self.latesVM iconURLForRow:indexPath.row].host == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"noimgCell"];
        //将Cell转换成自己想要的类型
        NoImgLatestCell* noImgCell = (NoImgLatestCell*)cell;
        [noImgCell setTitle:[self.latesVM titleForRow:indexPath.row] detail:[self.latesVM descForRow:indexPath.row]];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        LatestCell* latestCell = (LatestCell*)cell;
        [latestCell setImg:[self.latesVM iconURLForRow:indexPath.row] titile:[self.latesVM titleForRow:indexPath.row] desc:[self.latesVM descForRow:indexPath.row]];
//        [latestCell.iconIV setImageWithURL:[self.latesVM iconURLForRow:indexPath.row]];
//        latestCell.titleLb.text = [self.latesVM titleForRow:indexPath.row];
//        latestCell.descLb.text = [self.latesVM descForRow:indexPath.row];
        //latestCell.iconWidth.constant = (CELLHEIGHT - 24) * 1.3;
    }
 
    return cell;
}

kRemoveCellSeparator
//实现高亮，某行点击后实现的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController  *vc = [[DetailViewController alloc]initWithID:[self.latesVM IDForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
//头部方法，在Util文件夹下面添加ScollDisplay文件
-(void)configTableHeader{
    /*
     //如果没有头部的就不添加头部，不是所有的都将添加头部
    if (self.latesVM.headImageURLs.count == 0) {
        return;
    }
     */
    //头部视图的高度
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowH * 0.28)];
    
    NSArray *names = @[@"01.jpg", @"02.jpg", @"03.jpg", @"04.jpg", @"05.jpg"];
    //将之前的child移除，再新建
    [_sdVC removeFromParentViewController];
    
    _sdVC = [[ScrollDisplayViewController alloc]initWithImgNames:names];
    _sdVC.delegate = self;
    //保留控制器
    [self addChildViewController:_sdVC];
    [headerView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headerView);
    }];
    
    /*
    //传入头部图片的地址
    NSMutableArray *arr = [NSMutableArray new];
    for (LatestDataModel *model in self.latesVM.headImageURLs) {
        [arr addObject:[NSURL URLWithString:model.picUrl]];
    }
    
    _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:arr];
    
    [self addChildViewController:_sdVC];
    [headerView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headerView);
    }];
    */
    _tableView.tableHeaderView = headerView;
}
//实现协议方法
- (void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index{
/** 点击第几页了，第一次点击或者刷新都能触发 */
    DDLogVerbose(@"%ld", index);

}

//宏定义行高为屏幕高的0.2倍
#define CELLHEIGHT kWindowH * 0.13

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLHEIGHT;
}



@end
