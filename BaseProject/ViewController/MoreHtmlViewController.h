//
//  MoreHtmlViewController.h
//  BaseProject
//
//  Created by apple-jd26 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreHtmlViewController : UIViewController
- (id)initWithURL:(NSURL *)url;
@property (nonatomic, strong)NSURL *url;
@end
