//
//  NSObject+NSmanagedObjectContext_Category.m
//  HotelManager
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "NSObject+NSmanagedObjectContext_Category.h"
#import "AppDelegate.h"

@implementation NSObject (NSmanagedObjectContext_Category)

+ (NSManagedObjectContext *)managerContext {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    return  delegate.managedObjectContext;
    
}

@end
