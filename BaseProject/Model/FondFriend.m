//
//  FondFriend.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FondFriend.h"

@implementation FondFriend


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [FondFriendDataModel class]};
}
@end
@implementation FondFriendDataModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


