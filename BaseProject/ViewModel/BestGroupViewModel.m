//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"
#import "MoreNetManager.h"

@implementation BestGroupViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (BestGroupModel *)bestModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [MoreNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}
/** 英雄头像数组 */
- (NSArray *)iconURLsForRow:(NSInteger)row{
    return @[kIconPathWithEnName([self bestModelForRow:row].hero1),
             kIconPathWithEnName([self bestModelForRow:row].hero2),
             kIconPathWithEnName([self bestModelForRow:row].hero3),
             kIconPathWithEnName([self bestModelForRow:row].hero4),
             kIconPathWithEnName([self bestModelForRow:row].hero5)
             ];
}
/** 标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return [self bestModelForRow:row].title;
}
/** 详细描述 */
- (NSString *)descForRow:(NSInteger)row{
    return [self bestModelForRow:row].des;
}
/** 英雄描述数组 */
- (NSArray *)descsForRow:(NSInteger)row{
    return @[[self bestModelForRow:row].des1,
             [self bestModelForRow:row].des2,
             [self bestModelForRow:row].des3,
             [self bestModelForRow:row].des4,
             [self bestModelForRow:row].des5,
             ];
}


@end
