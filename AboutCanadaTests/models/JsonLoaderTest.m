//
//  AboutCanadaTests.m
//  AboutCanadaTests
//
//  Created by kpse on 7/30/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "JsonLoader.h"
#import "Page.h"
#import <XCTest/XCTest.h>


@interface JsonLoaderTest : XCTestCase

@end

@implementation JsonLoaderTest

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

- (void)testLoadJsonFromFile
{
    Page* page = [[[JsonLoader new] autorelease] loadContent];
    XCTAssertEqualObjects(page.title, @"About Canada", @"Should have matched");
    XCTAssertEqual(page.cards.count, 14, @"Should have matched");
}

@end
