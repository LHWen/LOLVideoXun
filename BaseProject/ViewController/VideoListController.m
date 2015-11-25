//
//  VideoListController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoListController.h"
#import "RoomViewModel.h"
#import "VideosListCell.h"
#import "PlayerViewController.h"

@interface VideoListController ()


@end

@implementation VideoListController

- (RoomViewModel *)roomListVM{
    if (!_roomListVM) {
        _roomListVM = [[RoomViewModel alloc] initWithDataId:_datas.ID gameId:_videoData.ID];
    }
    return _roomListVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.roomListVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }
            
        }];
    }];
    
//    [self.roomListVM getDataFromNetCompleteHandle:^(NSError *error) {
//        [self.tableView reloadData];
//    }];
//    
    [self.tableView.header beginRefreshing];
    
   // self.navigationController.navigationBar.barTintColor = kRGBColor(59, 59, 59);
   // self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.roomListVM.roomNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideosListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoList" forIndexPath:indexPath];
    [cell setImg:[self.roomListVM roomIconURLWithIndexPath:indexPath] title:[self.roomListVM roomTitleWithIndexPath:indexPath] decs:[self.roomListVM roomDesWithIndexPath:indexPath]];
    
    return cell;
}

kRemoveCellSeparator
//实现高亮，某行点击后实现的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //[self performSegueWithIdentifier:<#(nonnull NSString *)#> sender:<#(nullable id)#>]
}
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    [tableView viewfor]
//   // return 33;
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


#pragma mark - Navigation
/** 跳转到播放界面 */
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
       PlayerViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.dataModel = self.roomListVM.dataArr[indexPath.row];
    vc.catwordModel = self.videoData;
}


@end
