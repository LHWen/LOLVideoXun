//
//  ItemDetailModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemDetailModel.h"

@implementation ItemDetailModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID":@"id",
             @"desc":@"description"
             };
}

@end

@implementation ItemDetailExtattrsModel

//属性首字母小写->变大写
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName firstCharUpper];
}

@end