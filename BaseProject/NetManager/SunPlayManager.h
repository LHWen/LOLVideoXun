//
//  SunPlayManager.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "SunplayModel.h"

@interface SunPlayManager : BaseNetManager

+ (id)getSunPlayPage:(NSInteger)page Complete:(void(^)(SunplayModel *model, NSError *error))complete;

@end
