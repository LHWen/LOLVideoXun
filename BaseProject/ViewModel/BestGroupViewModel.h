//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "BestGroupModel.h"

/** 数组需要拼接，定义宏 */
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]
@interface BestGroupViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger rowNumber;
/** 英雄头像数组 */
- (NSArray *)iconURLsForRow:(NSInteger)row;
/** 标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 详细描述 */
- (NSString *)descForRow:(NSInteger)row;
/** 英雄描述数组 */
- (NSArray *)descsForRow:(NSInteger)row;

@end
