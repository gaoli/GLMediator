//
//  GLModuleA.m
//  GLMediator
//
//  Created by gaoli on 16/8/16.
//  Copyright © 2016年 gaoli. All rights reserved.
//

#import "GLModuleA.h"

@implementation GLModuleA

- (NSString *)actionA {
    return @"hello, world";
}

- (NSString *)actionB:(NSDictionary *)params {
    return [NSString stringWithFormat:@"hello, %@", params[@"name"]];
}

- (NSString *)actionC {
    return nil;
}

@end
