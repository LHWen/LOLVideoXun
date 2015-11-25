//
//  LatestViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestViewModel.h"

@implementation LatestViewModel

- (id)initWithZiXunType:(ZiXunListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
/** 防御性编程，不需要使用init初始化 */
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须要使用initWithZiXunType初始化", __FUNCTION__);
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
//获取每一行的数据
- (LatestDataModel *)LatestDataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self LatestDataModelForRow:row].picUrl];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self LatestDataModelForRow:row].title;
}

- (NSString *)descForRow:(NSInteger)row{
    return [self LatestDataModelForRow:row].desc;
}
//获取每一行的数据
- (NSString *)IDForRow:(NSInteger)row{
    return [self LatestDataModelForRow:row].ID;
}
////获取每一栏的数据头部图片
//- (NSNumber *)adIDForRow:(NSInteger)row{
//    LatestDataModel *model = self.headImageURLs[row];
//    //从数据项中获取ID 返回
//    return model.ID;
//}


//加载数据（刷新方法）
- (void)getDataFromNetCompleteHandle:(void(^)(NSError *error))completion{
    [LatesNetManager getZiXunListType:_type page:_page CompleteHandle:^(LatestModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
         completion(error);
    }];

    }
//刷新
- (void)refreshDataCompletionHandle:(void (^)(NSError *))completion{
    _page = 1;
    [self getDataFromNetCompleteHandle:completion];
}
//加载更多
- (void)getMoreDataCompletionHandle:(void (^)(NSError *))completion{
    _page += 1;
    [self getDataFromNetCompleteHandle:completion];
}

@end
