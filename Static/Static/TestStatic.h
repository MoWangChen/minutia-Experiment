//
//  TestStatic.h
//  Static
//
//  Created by xiepengxiang on 2020/8/7.
//  Copyright © 2020 xiepengxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestStatic : NSObject

- (void)setupNumber:(int)num;
- (int)getNumber;

- (void)setupObj:(TestStatic *)obj;
- (TestStatic *)getObj;

@end

