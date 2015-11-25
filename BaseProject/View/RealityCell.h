//
//  RealityCell.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RealityCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerPic;
@property (weak, nonatomic) IBOutlet UIImageView *sexPic;
@property (weak, nonatomic) IBOutlet UIImageView *picIV;
@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLb;
@property (weak, nonatomic) IBOutlet UILabel *areaLb;
@property (weak, nonatomic) IBOutlet UILabel *commentLb;
@property (weak, nonatomic) IBOutlet UILabel *goodLb;
//@property (weak, nonatomic) IBOutlet UILabel *nameLb;
- (void)setImage:(NSURL *)picURL;
@property (weak, nonatomic) IBOutlet UILabel *createdLb;
- (void)setImgIV:(NSURL *)headerPic;
@end
