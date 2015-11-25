//
//  ItemdetailViewController.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ItemdetailViewController : UIViewController

//@property (nonatomic, strong)ZBItemModel *itemDetail;
//- (id)initWithZBItemModel:(ZBItemModel *)itemDetail;
@property (nonatomic, assign)NSInteger ID;
- (id)initWithEquipId:(NSInteger)ID;
@end
