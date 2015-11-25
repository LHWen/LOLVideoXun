//
//  FondCell.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FondCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *acatarIV;
@property (weak, nonatomic) IBOutlet UIImageView *sexIv;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLb;
@property (weak, nonatomic) IBOutlet UILabel *areaAndSumonerLb;
@property (weak, nonatomic) IBOutlet UILabel *zdlLb;
@property (weak, nonatomic) IBOutlet UILabel *createdLb;
@property (weak, nonatomic) IBOutlet UILabel *sloganLb;
@property (weak, nonatomic) IBOutlet UILabel *enavleVoiceLb;
@property (weak, nonatomic) IBOutlet UILabel *cityLb;
@property (weak, nonatomic) IBOutlet UILabel *commentLb;
@property (weak, nonatomic) IBOutlet UILabel *goodLb;

- (void)setimgIV:(NSURL *)acatariv;
@end
