//
//  ViewController.m
//  CircleProgressDemo
//
//  Created by 周际航 on 15/12/28.
//  Copyright © 2015年 zjh. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()
// 进度条
@property (weak, nonatomic) IBOutlet CircleProgressView *progressView;
// 时间总长度
@property (nonatomic, assign) CGFloat timeLength;
// 当前时间
@property (nonatomic, assign) CGFloat currentTime;
// 计时器
@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeLength = 1*4;
    self.currentTime = 0;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerTask)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)timerTask{
    if (self.currentTime > self.timeLength) {
        // 音乐结束播放
        [self.displayLink invalidate];
        [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        return;
    }
    
    self.progressView.progress = self.currentTime/self.timeLength;
    self.currentTime += 1/60.0;     // 读取当前音乐播放到第几秒了，不要直接累加
}

@end
