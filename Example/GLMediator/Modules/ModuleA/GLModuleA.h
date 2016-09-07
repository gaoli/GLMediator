//
//  GLModuleA.h
//  GLMediator
//
//  Created by gaoli on 16/8/16.
//  Copyright © 2016年 gaoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLModuleA : NSObject

- (NSString *)actionA;
- (NSString *)actionB:(NSDictionary *)params;
- (NSString *)actionC;
- (NSString *)actionD:(NSDictionary *)params;

@end
