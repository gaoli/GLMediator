//
//  GLMediator.h
//  Pods
//
//  Created by gaoli on 16/8/12.
//
//

#import <Foundation/Foundation.h>

typedef NSString* (^GLParseTargetBlock)(NSURL *url);
typedef NSString* (^GLParseActionBlock)(NSURL *url);

@interface GLMediator : NSObject

@property (nonatomic, copy) NSString           *scheme;
@property (nonatomic, copy) GLParseTargetBlock  parseTargetBlock;
@property (nonatomic, copy) GLParseActionBlock  parseActionBlock;

+ (GLMediator *)shareInstance;

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end
