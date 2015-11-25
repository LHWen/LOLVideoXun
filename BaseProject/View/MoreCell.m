//
//  MoreCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MoreCell.h"

@implementation MoreCell

- (void)setIconViewWith:(NSURL *)iconURL title:(NSString *)name{
    [self.iconIV setImageWithURL:iconURL];
    self.nameLb.text = name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
