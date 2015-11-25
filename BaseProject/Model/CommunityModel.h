//
//  CommunityModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CommunityDataModel;
@interface CommunityModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<CommunityDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@property (nonatomic, assign) NSInteger page_session;

@end
@interface CommunityDataModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *modified;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *good;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *bad;

@property (nonatomic, copy) NSString *summoner;

@property (nonatomic, copy) NSString *created;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *close_comment;

@property (nonatomic, copy) NSString *pic_url_small;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *avatar;

@end

