//
//  VideosViewModel.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideosNetManager.h"

typedef NS_ENUM(NSUInteger, AllVideosListType) {
    AllVideosListTypeJieShuo,
    AllVideosListTypeYuLe,
    AllVideosListTypeSaiShi
};

@interface VideosViewModel : BaseViewModel
//行数
@property (nonatomic,assign)NSInteger rowNumber;
//每行显示的图片地址
- (NSURL *)picURLWithIndexPath:(NSIndexPath *)indexPath;
//显示每一行的游戏名称
- (NSString *)nameWithIndexPath:(NSIndexPath *)indexPath;

//数据类型
- (ViedosCatwordIdModel *)VideosListeWithIndexPath:(NSIndexPath *)indexPath;
- (VideosDataModel *)videosDataModelIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic,assign)NSInteger page;

@property (nonatomic,assign)AllVideosListType type;
- (id)initWithVideosType:(AllVideosListType)type;

@end
