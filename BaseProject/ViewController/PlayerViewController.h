//
//  PlayerViewController.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomListModel.h"
#import "VideosModel.h"

@interface PlayerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (nonatomic, strong)NSString *videoURL;
/** 用于传值，获取前页相应数据 */
@property (nonatomic, strong)RoomListDataModel *dataModel;
@property (nonatomic, strong)ViedosCatwordIdModel *catwordModel;
@end
