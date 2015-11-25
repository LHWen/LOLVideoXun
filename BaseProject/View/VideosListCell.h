//
//  VideosListCell.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *decsLb;
@property (weak, nonatomic) IBOutlet UIImageView *playIV;

- (void)setImg:(NSURL*)imgURL title:(NSString*)title decs:(NSString *)decs;

@end
