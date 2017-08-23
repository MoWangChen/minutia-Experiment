//
//  ViewController.m
//  dealloc
//
//  Created by 谢鹏翔 on 2017/8/23.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    NSMutableArray *_testGlobalArr3;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 对象dealloc 在哪个线程被释放
    // 在该对象的引用计数变为0的线程被调用
    
    // 1.主线程创建,主线程解除引用
    [self testMainQueue1];
    
    // 2.主线程创建,子线程解除引用
    [self testGlobalQueue2];
    
    // 3.子线程创建,子线程解除引用
    [self testGlobalQueue1];
    
    // 4.子线程创建,主线程解除引用
    [self testGlobalQueue3];
    
}

- (void)testMainQueue1
{
    Person *person = [[Person alloc] init];
    person.name = @"Lucy1";
    
    NSMutableArray *mutArr = [NSMutableArray array];
    [mutArr addObject:person];
    
    [mutArr removeObject:person];
}

- (void)testGlobalQueue1
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
       
        Person *person = [[Person alloc] init];
        person.name = @"Lucy2";
        
        NSMutableArray *mutArr = [NSMutableArray array];
        [mutArr addObject:person];
        
        [mutArr removeObject:person];
    });
}

- (void)testGlobalQueue2
{
    Person *person = [[Person alloc] init];
    person.name = @"Lucy3";
    
    NSMutableArray *mutArr = [NSMutableArray array];
    [mutArr addObject:person];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        [mutArr removeObject:person];
    });
}

- (void)testGlobalQueue3
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        Person *person = [[Person alloc] init];
        person.name = @"Lucy4";
        
        _testGlobalArr3 = [NSMutableArray array];
        [_testGlobalArr3 addObject:person];
        
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    [_testGlobalArr3 removeAllObjects];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
