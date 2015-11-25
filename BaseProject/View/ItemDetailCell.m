//
//  ItemDetailCell.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemDetailCell.h"

@implementation ItemDetailCell

/** 文字图片显示区域 */
- (UILabel *)descLb{
    if (!_descLb) {
        _descLb = [UILabel new];
        //        _descLb.backgroundColor = [UIColor redColor];
        
        
        UIView *garyView = [UIView new];
        garyView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:garyView];
        garyView.layer.cornerRadius = 5;
        [garyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView = [UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [garyView addSubview:whiteView];
        whiteView.layer.cornerRadius = 5;
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        
        [whiteView addSubview:self.descLb];
        self.descLb.numberOfLines = 0;
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
            
        }];
        
    }
    
    return _descLb;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
