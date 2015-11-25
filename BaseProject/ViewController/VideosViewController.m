//
//  VideosViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosViewController.h"
#import "VideosViewModel.h"
#import "VideosCollectionViewCell.h"
#import "VideoListController.h"

//#import "ScrollDisplayViewController.h"

@interface VideosViewController ()<UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *CollVC;
@property (nonatomic, strong)VideosViewModel *videosVM;

@end

@implementation VideosViewController

-(VideosViewModel *)videosVM{
    if (!_videosVM) {
        _videosVM = [[VideosViewModel alloc]initWithVideosType:_type];
    }
    return _videosVM;
}

//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _CollVC.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videosVM refreshDataCompletionHandle:^(NSError *error) {
            
            [_CollVC reloadData];
            [_CollVC.header endRefreshing];
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }
        }];
    }];
    [_CollVC.header beginRefreshing];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.videosVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setImg:[self.videosVM picURLWithIndexPath:indexPath] name:[self.videosVM nameWithIndexPath:indexPath]];
//    [cell.picIV setImageWithURL:[self.videosVM picURLWithIndexPath:indexPath.row]];
//    cell.nameLb.text = [self.videosVM nameWithIndexPath:indexPath.row];
    
    return cell;
}

//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 15, 15, 15);
}

//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 12;
}
//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 12;
}

//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.bounds.size.width - 80)/3;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    VideoListController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    vc.videoData = [self.videosVM VideosListeWithIndexPath:indexPath];
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
