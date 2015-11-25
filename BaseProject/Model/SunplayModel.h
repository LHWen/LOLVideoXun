//
//  SunplayModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class SunPlayDataModel;
@interface SunplayModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<SunPlayDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface SunPlayDataModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *json;

@property (nonatomic, copy) NSString *equips;

@property (nonatomic, copy) NSString *map;

@property (nonatomic, copy) NSString *userid;

@property (nonatomic, copy) NSString *hot;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *good;

@property (nonatomic, copy) NSString *content_md5;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger created;

@property (nonatomic, copy) NSString *summoner;

@property (nonatomic, copy) NSString *zdl;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *role_id;

@property (nonatomic, copy) NSString *file_url;

@end

