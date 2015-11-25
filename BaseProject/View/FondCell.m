//
//  FondCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FondCell.h"

@implementation FondCell

- (void)setimgIV:(NSURL *)acatariv{
    [self.acatarIV setImageWithURL:acatariv];
    self.acatarIV.layer.cornerRadius = 25;
    self.acatarIV.layer.masksToBounds = YES;
    //当前视图容易减掉超出自身区域的视图
    self.clipsToBounds = YES;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
