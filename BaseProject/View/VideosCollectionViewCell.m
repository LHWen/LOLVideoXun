//
//  VideosCollectionViewCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosCollectionViewCell.h"

@implementation VideosCollectionViewCell
- (void)setImg:(NSURL*)imgURL name:(NSString*)name{
    [self.picIV setImageWithURL:imgURL];
    self.nameLb.text = name;
    //self.picIV.layer.frame = CGRectMake(0, 0, 10, 10);
    self.picIV.layer.cornerRadius = 6;
    /** 开启修改 */
    self.picIV.layer.masksToBounds = YES;
}
@end
