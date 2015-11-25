//
//  SumAbilityDetailViewController.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SumAbilityModel.h"

@interface SumAbilityDetailViewController : UIViewController

- (id)initWithSumAbilityModel:(SumAbilityModel *)abilityModel;
@property(nonatomic,strong) SumAbilityModel *abilityModel;

@end
