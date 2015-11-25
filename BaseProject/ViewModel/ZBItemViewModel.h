//
//  ZBItemViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "MoreNetManager.h"

@interface ZBItemViewModel : BaseViewModel
- (id)initWithTag:(NSString *)tag;
@property (nonatomic, strong)NSString *tag;

@property (nonatomic,assign)NSInteger rowNumber;

- (ZBItemModel *)modelForRow:(NSInteger)row;

- (NSString *)itemNameForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSInteger)itemIdForRow:(NSInteger)row;

@end
