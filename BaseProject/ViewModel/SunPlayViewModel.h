//
//  SunPlayViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "SunPlayManager.h"

@interface SunPlayViewModel : BaseViewModel

/** 总共有多少行 */
@property (nonatomic,assign)NSInteger rowNumber;
/** 游戏大区 */
- (NSString *)areaForRow:(NSInteger)row;
/** 代表英雄头像 */
- (NSString *)roleIdForRow:(NSInteger)row;
/** 玩家头像 */
- (NSURL *)avatarForRow:(NSInteger)row;
/** 评论数 */
- (NSString *)commentForRow:(NSInteger)row;
/** 时间created */
/** 6神装 */
- (NSString *)equipsForRow:(NSInteger)row;
/** 赞数 */
- (NSString *)goodForRow:(NSInteger)row;
/** 地图模式 */
- (NSString *)mapForRow:(NSInteger)row;
/** 昵称 */
- (NSString *)nicknameForRow:(NSInteger)row;
/** 游戏ID */
- (NSString *)summonerForRow:(NSInteger)row;
/** 标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 战斗力 */
- (NSString *)zdlForRow:(NSInteger)row;

@property (nonatomic,assign)NSInteger page;

@end
