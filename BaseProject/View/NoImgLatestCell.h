//
//  NoImgLatestCell.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoImgLatestCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

//@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (void)setTitle:(NSString*)title detail:(NSString*)detail;
@end
