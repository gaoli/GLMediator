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

- (NSString *)actionD:(NSDictionary *)params {
    id        info = params[@"info"];
    NSString *name = nil;
    
    if ([info isKindOfClass:[NSArray class]]) {
        name = info[0];
    } else {
        name = info[@"name"];
    }
    
    return [NSString stringWithFormat:@"hello, %@", name];
}

@end
