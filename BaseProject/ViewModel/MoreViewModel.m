//
//  MoreViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MoreViewModel.h"

@implementation MoreViewModel

- (MoreModel *)moreForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 有多少行 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 某行的图标URL */
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self moreForRow:row].icon];
}
/** 某行的标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return [self moreForRow:row].name;
}
/** 某行的数据类型 -- 枚举类型 */
- (MoreItemType)itemTypeForRow:(NSInteger)row{
    NSString *type = [self moreForRow:row].type;
    if ([type isEqualToString:@"native"]) {
        return MoreItemTypeNative;
    }
    if ([type isEqualToString:@"web"]) {
        return MoreItemTypeWeb;
    }
    return 0;
}
/** 某行的tag值 */
- (NSString *)tagForRow:(NSInteger)row{
    return [self moreForRow:row].tag;
}
/** 网页类型的连接地址 */
- (NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self moreForRow:row].url];
}

/** 不是分页只是实现getData方法 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [MoreNetManager getMoreCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}


@end
