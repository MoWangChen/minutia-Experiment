//
//  ViewController.m
//  NSNotification
//
//  Created by 谢鹏翔 on 2017/6/21.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ViewController.h"

#define kMainQueueNotification @"kMainQueueNotification"
#define kGlobalQueueNotification @"kGlobalQueueNotification"

@interface ViewController ()

@property (nonatomic, strong) UIButton *mainButton;

@property (nonatomic, strong) UIButton *globalButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSelfAsObserver];
    
    [self.view addSubview:self.mainButton];
    [self.view addSubview:self.globalButton];
}

- (void)postNotificationAtMainQueue
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"postAtMainQueue---%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kMainQueueNotification object:nil];
    });
}

- (void)postNotificationAtGlobalQueue
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"postAtGlobalQueue---%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kGlobalQueueNotification object:nil];
    });
}

#pragma mark - NSNotification
- (void)addSelfAsObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainQueueNotification:) name:kMainQueueNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainQueueNotification:) name:kMainQueueNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(globalQueueNotification:) name:kGlobalQueueNotification object:nil];
}

- (void)mainQueueNotification:(NSNotification *)notification
{
    NSLog(@"mainQueueNotification----%@",[NSThread currentThread]);
}

- (void)globalQueueNotification:(NSNotification *)notification
{
    NSLog(@"globalQueueNotification----%@",[NSThread currentThread]);
}

#pragma mark - lazy load
- (UIButton *)mainButton
{
    if (!_mainButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(100, 100, 100, 30);
        [button setTitle:@"主线程发通知" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(postNotificationAtMainQueue) forControlEvents:UIControlEventTouchUpInside];
        _mainButton = button;
    }
    return _mainButton;
}

- (UIButton *)globalButton
{
    if (!_globalButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(100, 200, 100, 30);
        [button setTitle:@"子线程发通知" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(postNotificationAtGlobalQueue) forControlEvents:UIControlEventTouchUpInside];
        _globalButton = button;
    }
    return _globalButton;
}

@end
