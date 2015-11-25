
//
//  VideosModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosModel.h"

@implementation VideosModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [VideosDataModel class]};
}
@end

@implementation VideosDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"catwordId" : [ViedosCatwordIdModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"catwordId":@"catword_id", @"ID":@"id"};
}

@end

@implementation ViedosCatwordIdModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID":@"id",
             @"picUrl":@"pic_url"
             };
}

@end


