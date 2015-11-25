//
//  RoomViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RoomViewModel.h"


@implementation RoomViewModel

- (NSInteger)roomNumber{
    return self.dataArr.count;
}
/** 将需要初始化的属性放在同一个初始方法中 */
- (id)initWithDataId:(NSString *)dataId gameId:(NSString *)gameId{
    if (self = [super init]) {
        _dataId = dataId;
        _gameId = gameId;
    }
    return self;
}
/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须要使用roomNumber初始化方法", __FUNCTION__);
    }
    return self;
}
/** 对应项数的信息 */
- (RoomListDataModel *)modelWithIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[indexPath.row];
}
- (NSURL *)roomIconURLWithIndexPath:(NSIndexPath *)row{
    return [NSURL URLWithString:[self modelWithIndexPath:row].pic_url];
}
- (NSString *)roomTitleWithIndexPath:(NSIndexPath *)row{
    return [self modelWithIndexPath:row].title;
}
-(NSString *)roomDesWithIndexPath:(NSIndexPath *)row{
    return [self modelWithIndexPath:row].desc;
}
- (NSURL *)roomVideoURLWithIndexPath:(NSIndexPath *)row{
    return [NSURL URLWithString:[self modelWithIndexPath:row].video_url];
}

/** 加载网络数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
//    BaseViewModel *data = [BaseViewModel new];
    [VideosNetManager getRoomListFromDataId:_dataId page:_page GameId:_gameId Complete:^(RoomListModel *roomListModel, NSError *error) {
        if (!error) {
            /** 放外面 会产生时间差 */
            if (_page == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:roomListModel.data];

        }
    
        completionHandle(error);
    }];
}
//* 刷新 
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 加载更多 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

//- (RoomListDataModel *)roomListWithForRow:(NSInteger)row{
//    return self.dataArr[row];
//}

@end
