//
//  AllianceTests.m
//  AllianceTests
//
//  Created by junwen.wu on 14-7-20.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TheDarkPortal.h"

@interface AllianceTests : XCTestCase

@end

@implementation AllianceTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    
    [TheDarkPortal queryNewMissionWithDriverID:@"1" andDate:@"2014-07-26 21:16:12" onSucceed:^(NSMutableDictionary* succeed){
        
    }onFailure:^(NSMutableDictionary* status) {
        
    }];
}

@end
