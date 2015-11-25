//
//  RoomListModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RoomListModel.h"

@implementation RoomListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [RoomListDataModel class]};
}
@end
@implementation RoomListDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end


