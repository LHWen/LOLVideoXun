//
//  RealityNetManager.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RealityNetManager.h"

@implementation RealityNetManager

+ (id)getRealityPage:(NSInteger)page Complete:(void(^)(CommunityModel *model, NSError *error))complete{
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/UgcsService/getUserShows?order_kind=0&area=&page=%@&sex=&i_=866002024907023&t_=1445519422874&p_=10967&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&", @(page)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([CommunityModel objectWithKeyValues:responseObj], error);
    }];
}

@end
