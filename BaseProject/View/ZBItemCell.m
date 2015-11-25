//
//  ZBItemCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemCell.h"

@implementation ZBItemCell

- (UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        /** 设置字体大小 */
        _nameLb.font = [UIFont systemFontOfSize:11];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView{
    if (!_iconView) {
        _iconView = [[TRImageView alloc]init];
        _iconView.layer.cornerRadius = 10;
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
        
    }
    return _iconView;
}


@end
