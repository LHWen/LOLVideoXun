//
//  ItemdetailViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemdetailViewController.h"
#import "TRImageView.h"
#import "ItemViewModel.h"
#import "Factory.h"
#import "ItemDetailCell.h"

@interface ItemdetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
/** 添加头部视图,装备名称，价格，总价格，售价，装备图标 */
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)ItemViewModel *itemVM;
@property (nonatomic, strong)UILabel *label;
@end

@implementation ItemdetailViewController

- (ItemViewModel *)itemVM{
    if (!_itemVM) {
        _itemVM = [[ItemViewModel alloc]initWithIDForIndexPath:self.ID];
        
    }
    return _itemVM;
}

- (id)initWithEquipId:(NSInteger)ID{
    if (self = [super init]) {
        self.ID = ID;
        self.title = @"装备详情";
    }
    return self;
}
#pragma mark - 头部视图
- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        /** 装备图片 */
        TRImageView *imageView = [TRImageView new];
        imageView.layer.cornerRadius = 4;
        [_topView addSubview:imageView];
        NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", @(self.ID)]];
        [imageView.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.top.mas_equalTo(10);
        }];
        
        
    }
    return _topView;
}

#pragma  mark - 表格

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        /** 将tableView的背景设置为透明 */
        _tableView.backgroundColor = [UIColor clearColor];
        /** 不可点击 */
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = 0;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[ItemDetailCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
        }];
        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addBackItemToVC:self];
//    
    [self.itemVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
        [self.topView setNeedsDisplay];
    }];
    
    self.view.backgroundColor = kRGBColor(246, 247, 251);
    [self.tableView.header beginRefreshing];
    
}


#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
/** 头部显示 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"物品属性", @"合成需要", @"可合成"][section];
}
/** 自动扩高 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
/**    以下是头部视图中的名字和价格的配置 */
    /** 装置名称 */
    UILabel *ZBNameLb = [UILabel new];
    [_topView addSubview:ZBNameLb];
    CGFloat headerTop = 20;
    ZBNameLb.text = [self.itemVM nameForIndexPath];
    ZBNameLb.font = [UIFont systemFontOfSize:16];
    [ZBNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(headerTop);
    }];
    UILabel *allLb = [UILabel new];
    if ([self.itemVM priceForIndexPath] == 0) {
        allLb.text = nil;
//        headerTop += 10;
    }else{
    
    allLb.text = [NSString stringWithFormat:@"价格:%ld 总价格:%ld 售价:%ld",[self.itemVM priceForIndexPath], [self.itemVM allPriceForIndexPath], [self.itemVM sellPriceForIndexPath]];
    
    //        NSLog(@"%ld%ld%ld",self.price,self.allPrice,self.sellPrice);
    allLb.font = [UIFont systemFontOfSize:12];
    allLb.textColor = [UIColor lightGrayColor];
    [_topView addSubview:allLb];
    [allLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(ZBNameLb);
        make.top.mas_equalTo(ZBNameLb.mas_bottom).mas_equalTo(5);
    }];
    }
#pragma  mark - 分区判断
    /** 以下是分区判断 */
    if (indexPath.section == 0) {
        cell.descLb.text = [self.itemVM descForIndexPath];
    }
    /** 合成需要分区 */
    if (indexPath.section == 1) {
        
        NSString *picStr = [self.itemVM needForIndexPath];
        NSArray *arr = [picStr componentsSeparatedByString:@","];
        //        NSString *str1 = arr[0];
        /** 合成需求 */
        TRImageView *icon1 = [TRImageView new];
        [cell.descLb addSubview:icon1];
        icon1.layer.cornerRadius = 4;
        cell.descLb.text = @"因为添加的Label不是视图，Cell的高度随着label的行数变化";
//         cell.descLb.font = [UIFont systemFontOfSize:16];
        cell.descLb.textColor = [UIColor whiteColor];
        NSURL *descURL= [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", arr[0]]];
        if (arr.count >=1) {
            
            [icon1.imageView setImageWithURL:descURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
            [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(38);
                make.top.mas_equalTo(2);
                make.left.mas_equalTo(0);
            }];
            
        }
        /** 使用循环添加约束  在同一行的添加方式*/
        TRImageView *lastIcon = icon1;
        for (NSInteger i = 1; i < arr.count; i++) {
            TRImageView *subIcon = [TRImageView new];
            subIcon.layer.cornerRadius = 4;
            [cell.descLb addSubview:subIcon];
            descURL =[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", arr[i]]];
            [subIcon.imageView setImageWithURL:descURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
            [subIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(icon1);
                make.topMargin.mas_equalTo(icon1);
                make.left.mas_equalTo(lastIcon.mas_right).mas_equalTo(+10);
            }];
            lastIcon = subIcon;
        }
        
    }
    /** 合成分区 */
    if (indexPath.section == 2) {
        
        /** 多张图片的名称，是字符串编码，使用","隔开，排序有规律，就是用循环的方式进行排序 */
        NSString *compose = [self.itemVM composeForIndexPath];
        NSArray *composeArr = [compose componentsSeparatedByString:@","];
        cell.descLb.textColor = [UIColor whiteColor];
        
        //        TRImageView *lastIcon = icon;
        /** 顶部距离 */
        CGFloat top = 0;
        CGFloat left = -2;
        /** 当前是第几行 */
        NSInteger rrow = 1;
        NSInteger numberOfImagesInRow = (int)([UIScreen mainScreen].bounds.size.width / 51);
        TRImageView *icon = nil;
        
        for (NSInteger i=1; i <= composeArr.count ; i++) {
            TRImageView *subicon = [TRImageView new];
            subicon.layer.cornerRadius = 4;
            [cell.descLb addSubview:subicon];
            NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", composeArr[i-1]]];
            [subicon.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
            [subicon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(38);
                make.left.mas_equalTo(left);
                make.top.mas_equalTo(top);
            }];
            if (i%numberOfImagesInRow == 0) {
                top += 49;
                left = -2;
                rrow++;
            }else{
                left += 49;
            }
            icon = subicon;
        }
        if (rrow == 1) {
            cell.descLb.text = @"因为添加的Label不是视图，Cell的高度随着label的行数变化而变化的";
            
        }else if (rrow == 2){
            cell.descLb.text = @"因为添加的Label不是视图，Cell的高度随着label的行数变化而变化的因为添加的Label不是视图，Cell的高度随着label的行数";
            cell.descLb.font = [UIFont systemFontOfSize:20];
            
        }else if(rrow == 3) {
            cell.descLb.text = @"因为添加的Label不是视图，Cell的高度随着label的行数变化而变化的因为添加的Label不是视图，Cell的高度随着label的行数变化而变化的因为添加的Label不是视图，Cell的高度随着label的行数变化而变化的因为添加的Label不是视图Cell的高度随着label的行数变化而变化的因为添加";
            cell.descLb.font = [UIFont systemFontOfSize:15];
            
        }
        //
        //        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
        //            NSLog(@"%s, ===>%lu", __func__, rrow * 45);
        //            NSInteger height = rrow * 45 + 20;
        //            make.height.mas_equalTo(height);
        ////            make.height.mas_equalTo(icon.mas_bottom);
        //        }];
    }

    
    return cell;
}

//- (void)

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
