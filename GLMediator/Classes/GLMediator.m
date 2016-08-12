//
//  GLMediator.m
//  Pods
//
//  Created by gaoli on 16/8/12.
//
//

#import "GLMediator.h"

@implementation GLMediator

+ (GLMediator *)shareInstance {
    static GLMediator      *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[GLMediator alloc] init];
    });
    
    return instance;
}

@end
