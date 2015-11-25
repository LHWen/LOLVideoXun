//
//  RealityViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RealityViewModel.h"

@implementation RealityViewModel
/** 获取共有多少行 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 获取每一行的数据属性 */
- (CommunityDataModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 头像图片 */
- (NSURL *)avatarForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].avatar];
}
/** 账号名称 */
- (NSString *)nickNameForRow:(NSInteger)row{
    return [self dataModelForRow:row].nickname;
}
/** 所属游戏大区 */
- (NSString *)areaForRow:(NSInteger)row{
    return [self dataModelForRow:row].area;
}
/** 游戏昵称 */
- (NSString *)summonerForRow:(NSInteger)row{
    return [self dataModelForRow:row].summoner;
}
/** 文字说说 */
- (NSString *)descForRow:(NSInteger)row{
    return [self dataModelForRow:row].desc;
}
/** 照片地址 */
- (NSURL *)picURLSmallForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].pic_url_small];
}
/** 小照片地址 */
- (NSURL *)picURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].pic_url];
}
/** 更新时间 */
- (NSString *)createdForRow:(NSInteger)row{
    return [self dataModelForRow:row].created;
}
/** 男女有别 */
- (NSString *)sexForRow:(NSInteger)row{
    return [self dataModelForRow:row].sex;
}
/** 点赞次数 */
- (NSString *)goodForRow:(NSInteger)row{
    return [self dataModelForRow:row].good;
}
/** 评论次数 */
- (NSString *)commentForRow:(NSInteger)row{
    return [self dataModelForRow:row].comment;
}
/** 获取数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if (_page == 1) {
        [self.dataArr removeAllObjects];
    }
    [RealityNetManager getRealityPage:_page Complete:^(CommunityModel *model, NSError *error) {
        
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
