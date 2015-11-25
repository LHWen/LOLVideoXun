//
//  LatestCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestCell.h"

@implementation LatestCell

- (void)setImg:(NSURL*)imgURL titile:(NSString*)title desc:(NSString*)desc{
    [self.iconIV setImageWithURL:imgURL];
    self.titleLb.text = title;
    self.descLb.text = desc;
    self.iconIV.layer.frame = CGRectMake(0, 0, 10, 10);
    self.iconIV.layer.cornerRadius = 6;
    self.playIV.layer.cornerRadius = 14;
    self.iconIV.layer.masksToBounds = YES;
    //当前视图容易减掉超出自身区域的视图
    _iconIV.clipsToBounds = YES;
}

@end
