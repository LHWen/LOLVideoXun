//
//  ItemViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "MoreNetManager.h"

@interface ItemViewModel : BaseViewModel

@property (nonatomic, strong)ItemDetailModel *dataDic;
- (NSString *)nameForIndexPath;
- (NSInteger)priceForIndexPath;
- (NSInteger)allPriceForIndexPath;
- (NSInteger)sellPriceForIndexPath;
- (NSString *)descForIndexPath;
- (NSString *)needForIndexPath;
- (NSString *)composeForIndexPath;
//
- (id)initWithIDForIndexPath:(NSInteger)ID;
@property (nonatomic, assign)NSInteger ID;

//@property (nonatomic,assign)NSInteger page;

@end
