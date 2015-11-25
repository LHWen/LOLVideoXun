//
//  FondFriendController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FondFriendController.h"
#import "FondFriendViewModel.h"
#import "FondCell.h"

@interface FondFriendController ()
@property (nonatomic, strong)FondFriendViewModel *fondVM;
@end

@implementation FondFriendController

- (FondFriendViewModel *)fondVM{
    if (!_fondVM) {
        _fondVM = [FondFriendViewModel new];
    }
    return _fondVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    /** 去掉Cell分割线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /** 不可点击 */
    self.tableView.allowsSelection = NO;
    /** 不需要刷新  之前使用了刷新，程序有时候会崩掉（直接加载数据） */
    [self.fondVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
    }];
    
    [self.tableView.header beginRefreshing];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.fondVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FondFriendCell" forIndexPath:indexPath];
    cell.sloganLb.text = [self.fondVM sloganForRow:indexPath.row];
    cell.areaAndSumonerLb.text = [NSString stringWithFormat:@"召唤师:(%@)%@",[self.fondVM areaForRow:indexPath.row], [self.fondVM summonerForRow:indexPath.row]];
    
    if ([[self.fondVM enableVioce:indexPath.row] isEqualToString:@"0"]) {
        cell.enavleVoiceLb.text = @"开黑语音：不确定";
    }else if ([[self.fondVM enableVioce:indexPath.row] isEqualToString:@"1"]){
        cell.enavleVoiceLb.text = @"开黑语音：接受";
    }else if ([[self.fondVM enableVioce:indexPath.row] isEqualToString:@"0"]){
        cell.enavleVoiceLb.text = @"开黑语音：拒绝";
    }
    cell.zdlLb.text = [NSString stringWithFormat:@"战斗力:%@", [self.fondVM zdlForRow:indexPath.row]];
    if([[self.fondVM sexForRow:indexPath.row] isEqualToString:@"1"]) {
        [cell.sexIv setBackgroundColor:[UIColor blueColor]];
        [cell.sexIv setImage:[UIImage imageNamed:@"男"]];
    }else if([[self.fondVM sexForRow:indexPath.row] isEqualToString:@"2"]){
        [cell.sexIv setBackgroundColor:kRGBColor(211, 75, 75)];
        [cell.sexIv setImage:[UIImage imageNamed:@"女"]];
    }
    if (![self.fondVM cityForRow:indexPath.row]) {
        cell.cityLb.text = @"所在城市：未知";
    }else {
        cell.cityLb.text = [NSString stringWithFormat:@"所在城市：%@", [self.fondVM cityForRow:indexPath.row]];
    }
    cell.sloganLb.text = [NSString stringWithFormat:@"约战宣言：%@", [self.fondVM sloganForRow:indexPath.row]];
    cell.goodLb.text = [self.fondVM goodForRow:indexPath.row];
    cell.commentLb.text = [self.fondVM commentForRow:indexPath.row];
    //[cell.acatarIV setImageWithURL:[self.fondVM avatarURLForRow:indexPath.row]];
    [cell setimgIV:[self.fondVM avatarURLForRow:indexPath.row]];
    /** 读取时间的字符5-11 */
    cell.createdLb.text = [[self.fondVM createdForRow:indexPath.row] substringWithRange:NSMakeRange(5, 11)];
    
    return cell;
}

//实现高亮，某行点击后实现的方法 （实现了不可点击事件，就不在需要高亮了）
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
