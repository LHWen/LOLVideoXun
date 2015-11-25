//
//  RoomListModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class RoomListDataModel;
@interface RoomListModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<RoomListDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface RoomListDataModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSInteger published;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *video_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *item_id;

@property (nonatomic, copy) NSString *desc;

@end

