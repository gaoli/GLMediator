//
//  GLMediator.h
//  Pods
//
//  Created by gaoli on 16/8/12.
//
//

#import <Foundation/Foundation.h>

@interface GLMediator : NSObject

+ (GLMediator *)shareInstance;

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end
