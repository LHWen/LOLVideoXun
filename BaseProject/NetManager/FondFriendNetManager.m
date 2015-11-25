//
//  FondFriendNetManager.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FondFriendNetManager.h"

@implementation FondFriendNetManager
+ (id)getFondFriendCompleteHandle:(void(^)(FondFriend *model, NSError *error))complete{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/UgcsService/getCompanions?i_=866002024907023&t_=1445519892288&p_=9209&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([FondFriend objectWithKeyValues:responseObj], error);
    }];
}
@end
