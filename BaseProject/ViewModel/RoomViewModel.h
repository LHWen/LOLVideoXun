//
//  RoomViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideosNetManager.h"

@interface RoomViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger roomNumber;

/** 获取房间号的ID */
//- (id)initWithGameId:(NSString *)gameId;
@property(nonatomic,strong) NSString *gameId;
/** 获取分页的ID */
@property (nonatomic, strong)NSString *dataId;
/** 初始化方法放在一起，两个都需要 */
- (id)initWithDataId:(NSString *)dataId gameId:(NSString *)gameId;

@property (nonatomic,assign)NSInteger page;

- (NSURL *)roomIconURLWithIndexPath:(NSIndexPath *)row;
- (NSString *)roomTitleWithIndexPath:(NSIndexPath *)row;
- (NSString *)roomDesWithIndexPath:(NSIndexPath *)row;
/** 每一行的视频地址 */
- (NSURL *)roomVideoURLWithIndexPath:(NSIndexPath *)row;


- (RoomListDataModel *)modelWithIndexPath:(NSIndexPath *)indexPath;



@end
