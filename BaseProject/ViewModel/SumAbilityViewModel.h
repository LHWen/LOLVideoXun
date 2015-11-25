//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "MoreNetManager.h"

@interface SumAbilityViewModel : BaseViewModel

/** 多少行 */
@property (nonatomic,assign)NSInteger rowNumber;
/** 返回某行的数据类型，用于传值（详情） */
- (SumAbilityModel *)sumAbilityModelForRow:(NSInteger)row;
/** 返回每一行的标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 返回每一行的图片地址 */
- (NSURL *)iconURLForRow:(NSInteger)row;

@end
