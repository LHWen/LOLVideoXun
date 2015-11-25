//
//  RealityCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RealityCell.h"

@implementation RealityCell

- (void)setImage:(NSURL *)picURL{
    [self.picIV setImageWithURL:picURL];
    /** 修改表格为圆角 */
    //self.layer.cornerRadius = 20;
    
    //按比例放大,充满
    _picIV.contentMode = 2;
    //当前视图容易减掉超出自身区域的视图
    //    self.clipsToBounds = YES;
    self.picIV.clipsToBounds = YES;
    /** 修改图片为圆角 */
    self.picIV.layer.cornerRadius = 10;
    self.picIV.layer.masksToBounds = YES;

}

- (void)setImgIV:(NSURL *)headerPic{
    [self.headerPic setImageWithURL:headerPic];
    self.headerPic.layer.cornerRadius = 23;
    self.headerPic.layer.masksToBounds = YES;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
