//
//  RealityShowController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RealityShowController.h"
#import "RealityViewModel.h"
#import "RealityCell.h"

@interface RealityShowController ()

@property (nonatomic, strong)RealityViewModel *realityVM;
@end

@implementation RealityShowController

- (RealityViewModel *)realityVM{
    if (!_realityVM) {
        _realityVM = [RealityViewModel new];
    }
    return _realityVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 不可点击 */
    self.tableView.allowsSelection = NO;
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.realityVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
            if (error) {
                [self.tableView showErrorMsg:error.localizedDescription];
            }
        }];
    }];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.realityVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
            if (error) {
                [self.tableView showErrorMsg:error.localizedDescription];
            }
        }];
    }];
    //去掉cell分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.realityVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RealityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.nickNameLb.text = [self.realityVM nickNameForRow:indexPath.row];
    cell.areaLb.text = [NSString stringWithFormat:@"(%@)%@", [self.realityVM areaForRow:indexPath.row],[self.realityVM summonerForRow:indexPath.row]];
    if([[self.realityVM sexForRow:indexPath.row] isEqualToString:@"1"]) {
        [cell.sexPic setBackgroundColor:[UIColor blueColor]];
        [cell.sexPic setImage:[UIImage imageNamed:@"男"]];
    }else if([[self.realityVM sexForRow:indexPath.row] isEqualToString:@"2"]){
        [cell.sexPic setBackgroundColor:kRGBColor(211, 75, 75)];
        [cell.sexPic setImage:[UIImage imageNamed:@"女"]];
    }
    
    //[cell.picIV setImageWithURL:[self.realityVM picURLForRow:indexPath.row]];
    [cell setImage:[self.realityVM picURLForRow:indexPath.row]];
    cell.descLb.text = [self.realityVM descForRow:indexPath.row];
    cell.goodLb.text = [self.realityVM goodForRow:indexPath.row];
    cell.commentLb.text = [self.realityVM commentForRow:indexPath.row];
    //[cell.headerPic setImageWithURL:[self.realityVM avatarForRow:indexPath.row]];
    //cell.headerPic.layer.cornerRadius = 23;
    [cell setImgIV:[self.realityVM avatarForRow:indexPath.row]];
    cell.createdLb.text = [[self.realityVM createdForRow:indexPath.row] substringWithRange:NSMakeRange(5, 11)];
    return cell;
}


//实现高亮，某行点击后实现的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



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
