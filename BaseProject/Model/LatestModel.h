//
//  LatestModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface LatestModel : BaseModel

@property (nonatomic, assign) double code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, assign) double api;

@end


@interface LatestDataModel : BaseModel

@property (nonatomic, assign) double recommend;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, assign) double published;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *weightNew;
@property (nonatomic, strong) NSString *desc;

@end
