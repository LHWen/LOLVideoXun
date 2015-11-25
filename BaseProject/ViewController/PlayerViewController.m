//
//  PlayerViewController.m
//  BaseProject
//
//  Created by apple-jd26 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PlayerViewController ()<NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, strong)AVPlayer *player;
/** 将视频显示在屏幕上，需要一个layer */
@property (nonatomic, strong)AVPlayerLayer *layer;

@property(nonatomic,strong) NSURLSessionDownloadTask *task;
@property(nonatomic,strong) NSData *resumeData;
@end

@implementation PlayerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLb.text = self.dataModel.title;
    [self.imgView setImageWithURL:[NSURL URLWithString:self.dataModel.pic_url]];
    self.videoURL = self.dataModel.video_url;
    self.nameLb.text = self.catwordModel.name;
}
/** 下载视频 */
- (IBAction)downloadVideo:(id)sender {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    _task = [session downloadTaskWithURL:[NSURL URLWithString:self.videoURL]];
    [_task resume];
    
}
#pragma mark - NSURLSessionDownloadDelegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    /** 将下载的文件转存到documents文件下 */
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [docPath stringByAppendingPathComponent:@"video"];
    [[NSFileManager defaultManager]moveItemAtPath:location.path toPath:filePath error:nil];
    DDLogVerbose(@"filrPath %@", filePath);
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    dispatch_async(dispatch_get_main_queue(), ^{
        _progressView.progress = totalBytesWritten * 1.0/ totalBytesExpectedToWrite;
    });
}

/** 创建单例模式，为保证只有一个播放器 */
+ (AVPlayerViewController *)sharedInstance {
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

/** 播放视频 */
- (IBAction)playVideo:(id)sender {
    //self.imgView = nil;
//    [self.layer removeFromSuperlayer];
//    self.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.videoURL]];
//    self.layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//    self.layer.frame = CGRectMake(0, self.imgView.layer.frame.origin.y - 20, self.view.frame.size.width, 220);
//    self.imgView.backgroundColor = [UIColor blackColor];
//    [self.view.layer addSublayer:self.layer];
//    [self.player play];
    
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:self.videoURL]];
    [player play];
    [PlayerViewController sharedInstance].player = player;
    [sender addSubview:[PlayerViewController sharedInstance].view];
    [[PlayerViewController sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.imgView);
    }];
    self.imgView.userInteractionEnabled = YES;

}
/** 退出后停止播放 */
- (void)viewDidDisappear:(BOOL)animated {
    [[PlayerViewController sharedInstance].view removeFromSuperview];
    [PlayerViewController sharedInstance].player = nil;
}

/** 暂停 */
- (IBAction)stopPlayer:(id)sender {
    [self.player pause];
    /** 停止下载 */
    [_task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData = resumeData;
    }];
}
/** 点击返回后需要停止播放 */

/** 继续播放 */
- (IBAction)continuePlay:(id)sender {
    [self.player play];
    /** 继续下载 */
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
//    _task = [session downloadTaskWithResumeData:self.resumeData];
//    [_task resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
