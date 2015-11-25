//
//  ItemViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemViewModel.h"

@implementation ItemViewModel

- (id)initWithIDForIndexPath:(NSInteger)ID {
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

- (NSString *)nameForIndexPath {
    return self.dataDic.name;
}
- (NSInteger)priceForIndexPath {
    return self.dataDic.price;
}
- (NSInteger)allPriceForIndexPath {
    return self.dataDic.allPrice;
}
- (NSInteger)sellPriceForIndexPath {
    return self.dataDic.sellPrice;
}
- (NSString *)descForIndexPath {
    return self.dataDic.desc;
}
- (NSString *)needForIndexPath {
    return self.dataDic.desc;
}
- (NSString *)composeForIndexPath{
    return self.dataDic.compose;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    self.dataTask = [MoreNetManager getItemDetailWithItemId:self.ID completionHandle:^(id model, NSError *error) {
            self.dataDic = model;
        completionHandle(error);
    }];
    
}


@end
