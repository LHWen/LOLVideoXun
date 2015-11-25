//
//  SunPlayViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SunPlayViewModel.h"

@implementation SunPlayViewModel
/** 获取每一行的数据属性 */
- (SunPlayDataModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 总共有多少行 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 游戏大区 */
- (NSString *)areaForRow:(NSInteger)row{
    return [self dataModelForRow:row].area;
}
/** json id */
- (NSString *)roleIdForRow:(NSInteger)row{
    return [self dataModelForRow:row].role_id;
}
/** 用户头像 */
- (NSURL *)avatarForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].avatar];
}
/** 评论数 */
- (NSString *)commentForRow:(NSInteger)row{
    return [self dataModelForRow:row].comment;
}
/** 时间created */
/** 6神装 */
- (NSString *)equipsForRow:(NSInteger)row{
    return [self dataModelForRow:row].equips;
}
/** 赞数 */
- (NSString *)goodForRow:(NSInteger)row{
    return [self dataModelForRow:row].good;
}
/** 地图模式 */
- (NSString *)mapForRow:(NSInteger)row{
    return [self dataModelForRow:row].map;
}
/** 昵称 */
- (NSString *)nicknameForRow:(NSInteger)row{
    return [self dataModelForRow:row].nickname;
}
/** 游戏ID */
- (NSString *)summonerForRow:(NSInteger)row{
    return [self dataModelForRow:row].summoner;
}
/** 标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return  [self dataModelForRow:row].title;
}
/** 战斗力 */
- (NSString *)zdlForRow:(NSInteger)row{
    return [self dataModelForRow:row].zdl;
}

/** 加载数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if (_page == 1) {
        [self.dataArr removeAllObjects];
    }
        [SunPlayManager getSunPlayPage:_page Complete:^(SunplayModel *model, NSError *error) {
            [self.dataArr addObjectsFromArray:model.data];
            completionHandle(error);
        }];
    
}
/** 刷新 */
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 加载更多 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

@end
