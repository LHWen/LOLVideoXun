//
//  FondFriendNetManager.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "FondFriend.h"

@interface FondFriendNetManager : BaseNetManager
+ (id)getFondFriendCompleteHandle:(void(^)(FondFriend *model, NSError *error))complete;
@end
