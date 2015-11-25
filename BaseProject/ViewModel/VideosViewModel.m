//
//  VideosViewModel.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosViewModel.h"
#import "RoomViewModel.h"

@implementation VideosViewModel

- (id)initWithVideosType:(AllVideosListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须要使用initWithViedosType初始化", __FUNCTION__);
    }
    return self;
}

//加载数据
- (void)getDataFromNetWithType:(AllVideosListType)type CompleteHandle:(CompletionHandle)completion{
            [VideosNetManager getVideosComplete:^(VideosModel *model, NSError *error) {
                if (_page == 1) {
                    [self.dataArr removeAllObjects];
                }

            switch (type) {
                case AllVideosListTypeJieShuo: {
                    [self.dataArr addObjectsFromArray:model.data[0].catwordId];
                    break;
                }
                case AllVideosListTypeYuLe: {
                    [self.dataArr addObjectsFromArray:model.data[1].catwordId];
                    break;
                }
                case AllVideosListTypeSaiShi: {
                    [self.dataArr addObjectsFromArray:model.data[2].catwordId];
                    break;
                }
                default: {
                    break;
                }
            }

         completion(error);
     }];


}

//刷新
- (void)refreshDataCompletionHandle:(void (^)(NSError *))completion{
    _page = 1;
    [self getDataFromNetWithType:_type CompleteHandle:completion];
}
////加载更多
//- (void)getMoreDataCompletionHandle:(void (^)(NSError *))completion{
////    _page += 1;
//    [self getDataFromNetWithType:_type CompleteHandle:completion];
//}
//获取每一行的数据
- (ViedosCatwordIdModel *)ViedosCatwordIdForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (NSURL *)picURLWithIndexPath:(NSIndexPath *)indexPath{
    NSString *picPath = [self ViedosCatwordIdForRow:indexPath.row].picUrl;
    return [NSURL URLWithString:picPath];
}
- (NSString *)nameWithIndexPath:(NSIndexPath *)indexPath{
    return [self ViedosCatwordIdForRow:indexPath.row].name;
}

//返回总共有多少项
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

/** 获取catwordId中的数据 */
- (ViedosCatwordIdModel *)VideosListeWithIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[indexPath.row];
}

/** 获取Data中的数据，是为了获取data中的 id10172 */
- (VideosDataModel *)videosDataModelIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[indexPath.row];
}

@end
