//
//  SunPlayController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SunPlayController.h"
#import "SunPlayViewModel.h"
#import "SunPlayCell.h"

@interface SunPlayController ()
@property (nonatomic, strong)SunPlayViewModel *sunPlayVM;
@property (nonatomic, strong)SunplayModel *data;
@end

@implementation SunPlayController

- (SunplayModel *)data{
    if (!_data) {
        _data = [SunplayModel new];
    }
    return _data;
}

- (SunPlayViewModel *)sunPlayVM{
    if (!_sunPlayVM) {
        _sunPlayVM = [SunPlayViewModel new];
    }
    return _sunPlayVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 不可点击 */
    self.tableView.allowsSelection = NO;
    
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.sunPlayVM refreshDataCompletionHandle:^(NSError *error) {
                [self.tableView.header endRefreshing];
                [self.tableView reloadData];
                if (error) {
                    [self.tableView showErrorMsg:error.localizedDescription];
                }
            }];
        }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.sunPlayVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
            if (error) {
                [self.tableView showErrorMsg:error.localizedDescription];
            }
        }];
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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

    return self.sunPlayVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SunPlayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playCell" forIndexPath:indexPath];
    cell.titleLb.text = [self.sunPlayVM titleForRow:indexPath.row];
    cell.summonerLb.text = [NSString stringWithFormat:@"发布者：%@",[self.sunPlayVM nicknameForRow:indexPath.row]];
    if (![self.sunPlayVM areaForRow:indexPath.row]) {
        cell.nicknameLb.text = @"";
        cell.zdlLb.text = @"";
    }else{
    cell.nicknameLb.text = [NSString stringWithFormat:@"%@  %@", [self.sunPlayVM areaForRow:indexPath.row], [self.sunPlayVM summonerForRow:indexPath.row]];
    }
    if ([[self.sunPlayVM zdlForRow:indexPath.row] isEqualToString:@"0"]) {
        cell.zdlLb.text = @"";
    }else{
        cell.zdlLb.text = [NSString stringWithFormat:@"战斗力:%@",[self.sunPlayVM zdlForRow:indexPath.row]];
    }
//    
    NSString *path = [[NSBundle mainBundle]pathForResource:[self.sunPlayVM roleIdForRow:indexPath.row] ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    NSLog(@"%@",[dic valueForKey:@"duoname"]);
    [cell.headerIV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[dic valueForKey:@"duoname"]]]];
//    [cell.headerIV setImageWithURL:[self.sunPlayVM avatarForRow:indexPath.row]];
    cell.commentLb.text = [self.sunPlayVM commentForRow:indexPath.row];
    cell.goodLb.text = [self.sunPlayVM goodForRow:indexPath.row];
    cell.mapLb.text = [self.sunPlayVM mapForRow:indexPath.row];
//    
    NSString *str = [self.sunPlayVM equipsForRow:indexPath.row];
    NSString *str1 = [str componentsSeparatedByString:@","][0];
    NSString *str2 = [str componentsSeparatedByString:@","][1];
    NSString *str3 = [str componentsSeparatedByString:@","][2];
    NSString *str4 = [str componentsSeparatedByString:@","][3];
    NSString *str5 = [str componentsSeparatedByString:@","][4];
    NSString *str6 = [str componentsSeparatedByString:@","][5];
    cell.equipsOneIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",str1]];
    cell.equipsTwoIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",str2]];
    cell.equipsThreeIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",str3]];
    cell.equipsFourIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",str4]];
    cell.equipsFiveIv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",str5]];
    cell.equipsSixIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",str6]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
