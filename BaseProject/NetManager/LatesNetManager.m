//
//  LatesNetManager.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatesNetManager.h"

@implementation LatesNetManager
+ (id)getZiXunListType:(ZiXunListType)type page:(NSInteger)page CompleteHandle:(void(^)(LatestModel *model,NSError *error))completeHandle{
    //http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10178&cattype=news&page=1&i_=866002024907023&t_=1445516521737&p_=7556&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&
    //需要根据不同类型，设置对应的请求地址
    NSString *path = nil;
    //修改连接地址 p%@  对应的 @（page）
    switch (type) {
        case ZiXunListTypeZuiXin:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10178&cattype=news&page=%@&i_=866002024907023&t_=1445516521737&p_=7556&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&", @(page)];
            break;
        case ZiXunListTypeXinWen:
            path =[NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10000&cattype=news&page=%@&i_=866002024907023&t_=1445516566355&p_=21410&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case ZiXunListTypeSaiShi:
            path =[NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10006&cattype=news&page=%@&i_=866002024907023&t_=1445520098311&p_=27278&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&", @(page)];
            break;
        case ZiXunListTypeYuLe:
            path =[NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10179&cattype=news&page=%@&i_=866002024907023&t_=1445516575968&p_=20249&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
            
        default:
            break;
    }
//  NSLog(@"%ld",type);
    
    //只要有请求下来的数据公用一个解析类，就可以合写
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([LatestModel objectWithKeyValues:responseObj], error);
    }];
    
}


@end
