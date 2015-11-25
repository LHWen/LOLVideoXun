//
//  FondFriendViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "FondFriendNetManager.h"

@interface FondFriendViewModel : BaseViewModel

/** 有多少行 */
@property (nonatomic,assign)NSInteger rowNumber;
/** 头像地址 */
- (NSURL *)avatarURLForRow:(NSInteger)row;
/** 名字 */
- (NSString *)nicknameForRow:(NSInteger)row;
/** 男女有别 */
- (NSString *)sexForRow:(NSInteger)row;
/** 所在城市 */
- (NSString *)cityForRow:(NSInteger)row;
/** 召唤师峡谷大区 */
- (NSString *)areaForRow:(NSInteger)row;
/** 游戏昵称 */
- (NSString *)summonerForRow:(NSInteger)row;
/** 约战宣言 */
- (NSString *)sloganForRow:(NSInteger)row;
/** 战斗力 */
- (NSString *)zdlForRow:(NSInteger)row;
/** 时间 */
- (NSString *)createdForRow:(NSInteger)row;
/** 点赞数 */
- (NSString *)goodForRow:(NSInteger)row;
/** 评论数 */
- (NSString *)commentForRow:(NSInteger)row;
/** rank值 */
- (NSString *)rankForRow:(NSInteger)row;
/** 开黑语音 */
- (NSString *)enableVioce:(NSInteger)row;

@property (nonatomic,assign)NSInteger page;

@end
