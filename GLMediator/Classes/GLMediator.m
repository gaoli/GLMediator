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

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params {
    Class targetClass = NSClassFromString(targetName);
    id    target      = [[targetClass alloc] init];
    SEL   action      = NSSelectorFromString(actionName);
    
    if (target == nil) {
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
        #pragma clang diagnostic pop
    } else {
        return nil;
    }
}

@end
