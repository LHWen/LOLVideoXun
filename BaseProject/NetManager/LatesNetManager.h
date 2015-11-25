//
//  LatesNetManager.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LatestModel.h"

typedef NS_ENUM(NSUInteger, ZiXunListType) {
    ZiXunListTypeZuiXin,
    ZiXunListTypeXinWen,
    ZiXunListTypeSaiShi,
    ZiXunListTypeYuLe,
};


@interface LatesNetManager : BaseNetManager
//获取最新分页
+ (id)getZiXunListType:(ZiXunListType)type page:(NSInteger)page CompleteHandle:(void(^)(LatestModel *model,NSError *error))completeHandle;

@end
