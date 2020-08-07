//
//  main.m
//  Static
//
//  Created by xiepengxiang on 2020/8/7.
//  Copyright © 2020 xiepengxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestStatic.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 一个类中定义一个 static 变量, 这个 static 变量是所有这个类的实例共同拥有同一个, 还是每个实例都有一个
        TestStatic *test1 = [[TestStatic alloc] init];
        TestStatic *test2 = [[TestStatic alloc] init];
        [test1 setupNumber:1];
        NSLog(@"test 1 --- num : %d",[test1 getNumber]);
        NSLog(@"test 2 --- num : %d",[test2 getNumber]);
        
        [test2 setupNumber:2];
        NSLog(@"test 1 --- num : %d",[test1 getNumber]);
        NSLog(@"test 2 --- num : %d",[test2 getNumber]);
        
        TestStatic *obj1 = [[TestStatic alloc] init];
        TestStatic *obj2 = [[TestStatic alloc] init];
        NSLog(@"obj 1 address -- %@",obj1);
        NSLog(@"obj 2 address -- %@",obj2);
        
        [test1 setupObj:obj1];
        NSLog(@"test 1 --- obj : %@", [test1 getObj]);
        NSLog(@"test 2 --- obj : %@", [test2 getObj]);
        
        [test2 setupObj:obj2];
        NSLog(@"test 1 --- obj : %@", [test1 getObj]);
        NSLog(@"test 2 --- obj : %@", [test2 getObj]);
        
    }
    return 0;
}
