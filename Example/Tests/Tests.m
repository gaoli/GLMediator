//
//  GLMediatorTests.m
//  GLMediatorTests
//
//  Created by gaoli on 08/12/2016.
//  Copyright (c) 2016 gaoli. All rights reserved.
//

#import "GLMediator.h"

@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParseTarget {
    NSURL    *url        = [NSURL URLWithString:@"scheme://target/action"];
    NSString *targetName = [GLMediator shareInstance].parseTargetBlock(url);
    
    XCTAssert([targetName isEqualToString:@"target"]);
}

- (void)testParseAction {
    NSURL    *url        = [NSURL URLWithString:@"scheme://target/action"];
    NSString *actionName = [GLMediator shareInstance].parseActionBlock(url);
    
    XCTAssert([actionName isEqualToString:@"action"]);
}

- (void)testPerformAction {
    GLMediator *mediator = [GLMediator shareInstance];
    NSString   *result   = [mediator performTarget:@"GLModuleA" action:@"actionA" params:nil];
    
    XCTAssert([result isEqualToString:@"hello, world"]);
}

- (void)testPerformActionWithParams {
    GLMediator *mediator = [GLMediator shareInstance];
    NSString   *result   = [mediator performTarget:@"GLModuleA" action:@"actionB:" params:@{@"name": @"gaoli"}];
    
    XCTAssert([result isEqualToString:@"hello, gaoli"]);
}

- (void)testPerformActionWithUrl {
    NSURL      *url      = [NSURL URLWithString:@"scheme://GLModuleA/actionB:/?name=gaoli"];
    GLMediator *mediator = [GLMediator shareInstance];
    
    mediator.scheme = @"scheme";
    
    NSString *result = [mediator performActionWithUrl:url completion:^(NSDictionary *info) {
        XCTAssert([info[@"result"] isEqualToString:@"hello, gaoli"]);
    }];
    
    XCTAssert([result isEqualToString:@"hello, gaoli"]);
}

- (void)testResultIsNil {
    NSURL      *url      = [NSURL URLWithString:@"scheme://GLModuleA/actionC"];
    GLMediator *mediator = [GLMediator shareInstance];
    
    mediator.scheme = @"scheme";
    
    [mediator performActionWithUrl:url completion:^(NSDictionary *info) {
        XCTAssertEqual(info[@"result"], [NSNull null]);
    }];
}

@end
