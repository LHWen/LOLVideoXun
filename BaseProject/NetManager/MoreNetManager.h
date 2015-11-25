//
//  MoreNetManager.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "MoreModel.h"
#import "BestGroupModel.h"
#import "SumAbilityModel.h"
#import "ZBCategoryModel.h"
#import "ZBItemModel.h"
#import "ItemDetailModel.h"

@interface MoreNetManager : BaseNetManager
/** 获取更多游戏列表 */
+ (id)getMoreCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取最佳阵容 */
+ (id)getHeroBestGroupCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取召唤师技能 */
+ (id)getSumAbilityCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取装备分类 */
+ (id)getZBCategoryCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/**
 *  获取某分类装备列表
 *  @param tag 分类tag
 *  @return
 */
+ (id)getZBItemListWithTag:(NSString *)tag kCompletionHandle;

/**
 *  装备详情
 *  @param itemId 装备id
 *  @return
 */
+ (id)getItemDetailWithItemId:(NSInteger)itemId kCompletionHandle;

@end
