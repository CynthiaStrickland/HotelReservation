//
//  HotelReservationTests.m
//  HotelReservationTests
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <XCTest/XCTest.h>
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
    [super tearDown];
    [self setContext:nil];
}

- (void)testContextCreation {
    XCTAssertNotNil(self.context, @"Context should not be nil. Check category implementation.");
}

- (void)testContextOnMainQ {
    XCTAssertTrue(self.context.concurrencyType == NSMainQueueConcurrencyType, @"Context should be created on the main Q.  Why did you change it?");
}

- (void)testCoreDataSave {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.resultType = NSCountResultType;
    
    NSError *error;
    NSArray *result = [self.context executeFetchRequest:request error:&error];
    NSNumber *count = [result firstObject];
    
    XCTAssertNil(error, @"Error should be nil.");
    XCTAssertNotNil(result, @"Result array should NOT be nil.");
    XCTAssertTrue([count intValue] > 0, @"Number of objects in the database after seeing should be greater than 0.");
}

@end
