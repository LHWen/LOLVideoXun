//
//  VideosListCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosListCell.h"

@implementation VideosListCell

- (void)setImg:(NSURL *)imgURL title:(NSString *)title decs:(NSString *)decs{
    [self.iconIV setImageWithURL:imgURL];
    self.titleLb.text = title;
    self.decsLb.text = decs;
    self.iconIV.layer.frame = CGRectMake(0, 0, 10, 10);
    self.iconIV.layer.cornerRadius = 6;
    self.playIV.layer.cornerRadius = 15;
    //self.playIV.backgroundColor = [UIColor blueColor];
    /** 开启修改 */
    self.iconIV.layer.masksToBounds = YES;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
