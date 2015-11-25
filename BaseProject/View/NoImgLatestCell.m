//
//  NoImgLatestCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NoImgLatestCell.h"

@implementation NoImgLatestCell

- (void)setTitle:(NSString*)title detail:(NSString*)detail{
    self.titleLabel.text = title;
    self.detailLabel.text = detail;
}
@end
