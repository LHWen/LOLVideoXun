//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "MoreNetManager.h"

@interface ZBCategoryViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger rowNumber;
/** 每一行的tag值 */
- (NSString *)tagForRow:(NSInteger)row;
/** 每一行的题目 */
- (NSString *)titleForRow:(NSInteger)row;

@end
