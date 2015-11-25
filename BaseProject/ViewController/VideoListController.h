//
//  VideoListController.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideosModel.h"
@class RoomViewModel;
@interface VideoListController : UITableViewController
@property (nonatomic, strong)ViedosCatwordIdModel *videoData;
@property (nonatomic, strong)VideosDataModel *datas;
@property (nonatomic, strong)RoomViewModel *roomListVM;
@end
