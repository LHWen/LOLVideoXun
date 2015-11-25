//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"

@implementation SumAbilityViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

/** 返回某行的数据类型，用于传值 */
- (SumAbilityModel *)sumAbilityModelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 返回每一行的标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return [self sumAbilityModelForRow:row].name;
}
/** 返回每一行的图片地址 */
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", [self sumAbilityModelForRow:row].ID]];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [MoreNetManager getSumAbilityCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}


@end
