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

@end

