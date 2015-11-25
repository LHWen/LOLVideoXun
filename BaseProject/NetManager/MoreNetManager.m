//
//  MoreNetManager.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MoreNetManager.h"

@implementation MoreNetManager
/** 获取更多列表 */
+ (id)getMoreCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = @"http://box.dwstatic.com/apiToolMenu.php?category=database&v=140&OSType=iOS9.1&versionName=2.4.0";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MoreModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

/** 获取最佳阵容 */
+ (id)getHeroBestGroupCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = @"http://box.dwstatic.com/apiHeroBestGroup.php?v=140&OSType=iOS9.1";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestGroupModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

/** 获取召唤师技能 */
+ (id)getSumAbilityCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = @"http://lolbox.duowan.com/phone/apiSumAbility.php?v=140&OSType=iOS9.1";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

/** 获取装备分类 */
+ (id)getZBCategoryCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = @"http://lolbox.duowan.com/phone/apiZBCategory.php?v=140&OSType=iOS9.1&versionName=2.4.0";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCategoryModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

/**
 *  获取某分类装备列表
 *  @param tag 分类tag
 *  @return
 */
+ (id)getZBItemListWithTag:(NSString *)tag kCompletionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@&v=140&OSType=iOS9.1&versionName=2.4.0",tag];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                   completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

/**
 *  装备详情
 *  @param itemId 装备id
 *  @return
 */
+ (id)getItemDetailWithItemId:(NSInteger)itemId kCompletionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiItemDetail.php?id=%@&v=140&OSType=iOS9.1",@(itemId)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj],error);
    }];
}

@end
