//
//  MoreViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "MoreNetManager.h"

/** 定义type枚举类型，有web和native 两个值 */
typedef NS_ENUM(NSUInteger, MoreItemType){
    MoreItemTypeNative,
    MoreItemTypeWeb,
};
@interface MoreViewModel : BaseViewModel
/** 有多少行 */
@property (nonatomic,assign)NSInteger rowNumber;
/** 某行的图标URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 某行的标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某行的数据类型 -- 枚举类型 */
- (MoreItemType)itemTypeForRow:(NSInteger)row;
/** 某行的tag值 */
- (NSString *)tagForRow:(NSInteger)row;
/** 网页类型的连接地址 */
- (NSURL *)webURLForRow:(NSInteger)row;

@end
