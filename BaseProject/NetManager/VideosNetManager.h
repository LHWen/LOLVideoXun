//
//  VideosNetManager.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideosModel.h"
#import "RoomListModel.h"

@interface VideosNetManager : BaseNetManager

+ (id)getVideosComplete:(void(^)(VideosModel *model, NSError *error))complete;

//获取房间列表
//参数：类别标识、数据申请的起始项、limit表示每次申请的数量，这里使用固定值就可以了，不需要传值
+ (id)getRoomListFromDataId:(NSString *)dataId page:(NSInteger)page GameId:(NSString *)cateId Complete:(void(^)(RoomListModel *roomListModel, NSError *error))complete;

@end
