//
//  MoreController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MoreController.h"
#import "MoreCell.h"
#import "MoreViewModel.h"
#import "MoreHtmlViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategotyViewController.h"
#import "SumAbilityViewController.h"

@interface MoreController ()
@property (nonatomic, strong)MoreViewModel *moreVM;
@end

@implementation MoreController

- (MoreViewModel *)moreVM{
    if (!_moreVM) {
        _moreVM = [MoreViewModel new];
    }
    return _moreVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 52;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.moreVM getDataFromNetCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
            }
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.moreVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moreCell" forIndexPath:indexPath];
    
    [cell setIconViewWith:[self.moreVM iconURLForRow:indexPath.row] title:[self.moreVM titleForRow:indexPath.row]];
    
    return cell;
}

/** 去掉分割线 */
kRemoveCellSeparator
/** 去掉选择效果 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.moreVM itemTypeForRow:indexPath.row] == MoreItemTypeWeb) {
        MoreHtmlViewController *vc = [[MoreHtmlViewController alloc]initWithURL:[self.moreVM webURLForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        if ([[self.moreVM tagForRow:indexPath.row] isEqualToString:@"best_group"]) {
            BestGroupViewController *vc = [BestGroupViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([[self.moreVM tagForRow:indexPath.row] isEqualToString:@"item"]) {
            ZBCategotyViewController *vc = [ZBCategotyViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([[self.moreVM tagForRow:indexPath.row] isEqualToString:@"sum_ability"]) {
            SumAbilityViewController *vc = [SumAbilityViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        
    }
}


//-(instancetype)init{
//    if (self = [super init]) {
//        self.title = @"游戏列表";
//    }
//    return self;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
