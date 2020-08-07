//
//  TestStatic.m
//  Static
//
//  Created by xiepengxiang on 2020/8/7.
//  Copyright © 2020 xiepengxiang. All rights reserved.
//

#import "TestStatic.h"

static int _number = 0;
static TestStatic *_staticObj = nil;

@implementation TestStatic

- (void)setupNumber:(int)num {
    _number = num;
}

- (int)getNumber {
    return _number;
}

- (void)setupObj:(TestStatic *)obj {
    _staticObj = obj;
}

- (TestStatic *)getObj {
    return _staticObj;
}

@end
