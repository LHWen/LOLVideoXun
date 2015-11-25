//
//  FondFriendViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FondFriendViewModel.h"

@implementation FondFriendViewModel

/** 获取属性数组 */
- (FondFriendDataModel *)FondFriendDataModel:(NSInteger)row{
    return self.dataArr[row];
}
/** 有多少行 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 头像地址 */
- (NSURL *)avatarURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self FondFriendDataModel:row].avatar];
}
/** 名字 */
- (NSString *)nicknameForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].nickname;
}
/** 男女有别 */
- (NSString *)sexForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].sex;
}
/** 所在城市 */
- (NSString *)cityForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].city;
}
/** 召唤师峡谷大区 */
- (NSString *)areaForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].area;
}
/** 游戏昵称 */
- (NSString *)summonerForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].summoner;
}
/** 约战宣言 */
- (NSString *)sloganForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].slogan;
}
/** 战斗力 */
- (NSString *)zdlForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].zdl;
}
/** 时间 */
- (NSString *)createdForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].created;
}
/** 点赞数 */
- (NSString *)goodForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].good;
}
/** 评论数 */
- (NSString *)commentForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].comment;
}
/** rank值 */
- (NSString *)rankForRow:(NSInteger)row{
    return [self FondFriendDataModel:row].rank;
}
/** 开黑语音 */
- (NSString *)enableVioce:(NSInteger)row{
    return [self FondFriendDataModel:row].enable_voice;
}

/** 数据加载 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    //    if (_page == 1) {
    //        [self.dataArr removeAllObjects];
    //    }
    
    self.dataTask = [FondFriendNetManager getFondFriendCompleteHandle:^(FondFriend *model, NSError *error) {
        if (!error) {
            [self.dataArr addObjectsFromArray:model.data];
        }
        completionHandle(error);
    }];
}
//- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
//    _page = 1;
//    [self getDataFromNetCompleteHandle:completionHandle];
//}

@end
