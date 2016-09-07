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

- (id)init {
    self = [super init];
    
    if (self) {
        self.parseTargetBlock = ^(NSURL *url) {
            return url.host;
        };
        
        self.parseActionBlock = ^(NSURL *url) {
            return [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
        };
    }
    
    return self;
}

- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion {
    NSString     *scheme     = url.scheme;
    NSDictionary *params     = [self parseParams:url.query];
    NSString     *targetName = self.parseTargetBlock(url);
    NSString     *actionName = self.parseActionBlock(url);
    
    if (![[scheme lowercaseString] isEqualToString:[self.scheme lowercaseString]]) {
        return @(NO);
    }
    
    id result = [self performTarget:targetName action:actionName params:params];
    
    if (completion) {
        if (result) {
            completion(@{@"result": result});
        } else {
            completion(@{@"result": [NSNull null]});
        }
    }
    
    return result;
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

#pragma mark - private methods

- (NSDictionary *)parseParams:(NSString *)query {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    for (NSString *param in [query componentsSeparatedByString:@"&"]) {
        NSArray *kvPair = [param componentsSeparatedByString:@"="];
        
        if (kvPair.count < 2) {
            continue;
        }
        
        NSString *key = kvPair[0];
        NSString *val = kvPair[1];
        
        val = [val stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        if (([val hasPrefix:@"["] && [val hasSuffix:@"]"]) ||
            ([val hasPrefix:@"{"] && [val hasSuffix:@"}"])) {
            NSData *data = [val dataUsingEncoding:NSUTF8StringEncoding];
            id      json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            [params setObject:json forKey:key];
        } else {
            [params setObject:val  forKey:key];
        }
    }
    
    return params;
}

@end
