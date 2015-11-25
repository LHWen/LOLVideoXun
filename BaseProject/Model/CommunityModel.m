//
//  CommunityModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CommunityModel.h"

@implementation CommunityModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [CommunityDataModel class]};
}
@end

@implementation CommunityDataModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


