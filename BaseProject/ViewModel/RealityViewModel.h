//
//  RealityViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RealityNetManager.h"

@interface RealityViewModel : BaseViewModel
/** 有多少行 */
@property (nonatomic,assign)NSInteger rowNumber;

/** 头像图片 */
- (NSURL *)avatarForRow:(NSInteger)row;
/** 账号名称 */
- (NSString *)nickNameForRow:(NSInteger)row;
/** 所属游戏大区 */
- (NSString *)areaForRow:(NSInteger)row;
/** 游戏昵称 */
- (NSString *)summonerForRow:(NSInteger)row;
/** 文字说说 */
- (NSString *)descForRow:(NSInteger)row;
/** 照片地址 */
- (NSURL *)picURLSmallForRow:(NSInteger)row;
/** 小照片地址 */
- (NSURL *)picURLForRow:(NSInteger)row;
/** 更新时间 */
- (NSString *)createdForRow:(NSInteger)row;
/** 男女有别 */
- (NSString *)sexForRow:(NSInteger)row;
/** 点赞次数 */
- (NSString *)goodForRow:(NSInteger)row;
/** 评论次数 */
- (NSString *)commentForRow:(NSInteger)row;

@property (nonatomic,assign)NSInteger page;

@end
