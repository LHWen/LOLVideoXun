//
//  LatestCell.h
//  BaseProject
//
//  Created by apple-jd26 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatestCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet UIImageView *playIV;

- (void)setImg:(NSURL*)imgURL titile:(NSString*)title desc:(NSString*)desc;
@end
