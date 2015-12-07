//
//  NSObject+NSmanagedObjectContext_Category.h
//  HotelManager
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

@interface NSObject (NSmanagedObjectContext_Category)

+ (NSManagedObjectContext *)managerContext;

@end
