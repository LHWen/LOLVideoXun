//
//  FondFriend.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class FondFriendDataModel;
@interface FondFriend : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<FondFriendDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface FondFriendDataModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *slogan;

@property (nonatomic, copy) NSString *good_at;

@property (nonatomic, copy) NSString *tier;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *field;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, copy) NSString *good;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *enable_voice;

@property (nonatomic, copy) NSString *summoner;

@property (nonatomic, copy) NSString *zdl;

@property (nonatomic, copy) NSString *created;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *avatar;

@end

