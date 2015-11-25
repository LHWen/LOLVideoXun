//
//  LatestViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LatesNetManager.h"

@interface LatestViewModel : BaseViewModel
//分区
- (id)initWithZiXunType:(ZiXunListType)type;
@property (nonatomic,assign)ZiXunListType type;

//读取有多少行
@property (nonatomic,assign)NSInteger rowNumber;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
//获取每一行的ID
- (NSNumber *)IDForRow:(NSInteger)row;

@property (nonatomic,assign)NSInteger page;
//头部滚动栏，图片数组
@property(nonatomic,strong)NSArray *headImageURLs;


@end
