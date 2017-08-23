//
//  Person.m
//  dealloc
//
//  Created by 谢鹏翔 on 2017/8/23.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"%@ -- dealloc --- %@", self.name,[NSThread currentThread]);
}

@end
