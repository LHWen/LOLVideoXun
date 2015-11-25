//
//  SunplayModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SunplayModel.h"

@implementation SunplayModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [SunPlayDataModel class]};
}
@end
@implementation SunPlayDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


