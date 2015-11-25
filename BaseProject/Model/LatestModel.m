//
//  LatestModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestModel.h"

@implementation LatestModel

+ (NSDictionary *)objectClassInArray{
    return @{@"data":[LatestDataModel class]};
}

@end


@implementation LatestDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID":@"id",
             @"picUrl":@"pic_url",
             @"videoUrl":@"video_url",
             @"weightNew":@"weight_new"
             };
}



@end
