//
//  VideosCollectionViewCell.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
- (void)setImg:(NSURL*)imgURL name:(NSString*)name;

@end
