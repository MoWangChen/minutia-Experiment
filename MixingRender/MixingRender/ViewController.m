//
//  ViewController.m
//  MixingRender
//
//  Created by 谢鹏翔 on 2017/7/26.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addButtonOne];
    [self addButtonTwo];
    [self addButtonThree];
}

- (void)addButtonOne
{
    UIButton *button = [self testButton:CGRectMake(50, 80, 100, 50) title:@"测试1"];
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1.f;
    [self.view addSubview:button];
}

- (void)addButtonTwo
{
    UIButton *button = [self testButton:CGRectMake(50, 140, 100, 50) title:@"策士2"];
    button.layer.cornerRadius = 25.f;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1.f;
    [self.view addSubview:button];
}

- (void)addButtonThree
{
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.frame = CGRectMake(0, 0, 100, 50);
    mask.path = [UIBezierPath bezierPathWithRoundedRect:mask.frame cornerRadius:25.f].CGPath;
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, 100, 50);
    borderLayer.path = mask.path;
    borderLayer.lineWidth = 2.f;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor blackColor].CGColor;
    borderLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UIButton *button = [self testButton:CGRectMake(50, 200, 100, 50) title:@"测试3"];
    button.layer.mask = mask;
    [button.layer addSublayer:borderLayer];
    [self.view addSubview:button];
}

- (UIButton *)testButton:(CGRect)frame title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor purpleColor];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.titleLabel.backgroundColor = [UIColor orangeColor];
    button.titleLabel.layer.masksToBounds = YES;
    
    return button;
}


@end
