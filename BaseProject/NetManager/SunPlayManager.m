//
//  SunPlayManager.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SunPlayManager.h"

@implementation SunPlayManager

+ (id)getSunPlayPage:(NSInteger)page Complete:(void(^)(SunplayModel *model, NSError *error))complete{
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/PlaysService/userPlayList?order_kind=0&role_id=0&page=%@&i_=866002024907023&t_=1445519662927&p_=11126&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&", @(page)];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([SunplayModel objectWithKeyValues:responseObj],error);
    }];
}

@end
