//
//  ViewController.m
//  Block
//
//  Created by 谢鹏翔 on 2018/3/9.
//  Copyright © 2018年 365ime. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self testBlock_variant];
}

- (void)testBlock
{
    typedef void (^Block)(void);
    
    __block int i = 10;
    Block block = ^(){
        NSLog(@"inner block 1 -- %d", i);
        i = 20;
        NSLog(@"inner block 2 -- %d", i);
    };
    i = 30;
    block();
    NSLog(@"outer block -- %d", i);
}

- (void)testBlock_variant
{
    typedef void (^Block)(void);
    
    int i = 10;
    int * i_block = &i;   // 定义指针变量 i_block 指向 i 变量的地址
    Block block = ^(){
        NSLog(@"inner block 2 -- %d", * i_block); // * i_block 取地址的值
        * i_block = 20; // 对 i_block对应地址的值进行修改
        NSLog(@"inner block 2 -- %d", * i_block);
    };
    i = 30;
    block();
    NSLog(@"outer block -- %d", i);
}

@end
