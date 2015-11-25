//
//  VideosNetManager.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosNetManager.h"

@implementation VideosNetManager

+ (id)getVideosComplete:(void(^)(VideosModel *model, NSError *error))complete{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/CatalogsService/all?cattype=video&i_=866002024907023&t_=1445515447757&p_=25616&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([VideosModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getRoomListFromDataId:(NSString *)dataId page:(NSInteger)page GameId:(NSString *)cateId Complete:(void(^)(RoomListModel *roomListModel, NSError *error))complete{
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/videos?catid=%@&page=%ld&catwordid=%@&i_=866002024907023&t_=1445515496947&p_=23186&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",dataId, page, cateId];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([RoomListModel objectWithKeyValues:responseObj], error);
    }];
}

@end
