//
//  HotelReservationTests.m
//  HotelReservationTests
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "NSObject+NSManagedObjectContext_Category.h"

@interface HotelReservationTests : XCTestCase

@property (strong, nonatomic) NSManagedObjectContext *context;
@end

@implementation HotelReservationTests

- (void)setUp {
    [super setUp];

    [self setContext:[NSManagedObjectContext managerContext]];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testContextCreation {
    XCTAssertNotNil(self.context, @"Context should not be nil. Check category implementation.");
}

- (void)testContextOnMainQ {
    XCTAssertTrue(self.context.concurrencyType == NSMainQueueConcurrencyType, @"Context should be created on the main Q.  Why did you change it?");
}

- (void)test

@end
