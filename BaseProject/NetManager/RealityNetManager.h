//
//  RealityNetManager.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "CommunityModel.h"

@interface RealityNetManager : BaseNetManager
+ (id)getRealityPage:(NSInteger)page Complete:(void(^)(CommunityModel *model, NSError *error))complete;

@end
