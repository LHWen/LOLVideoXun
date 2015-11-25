//
//  VideosModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@class VideosDataModel,ViedosCatwordIdModel;
@interface VideosModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<VideosDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface VideosDataModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<ViedosCatwordIdModel *> *catwordId;

@end

@interface ViedosCatwordIdModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

@end

