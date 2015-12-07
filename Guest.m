//
//  Guest.m
//  HotelReservation
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "Guest.h"
#import "Reservation.h"
#import "AppDelegate.h"

@implementation Guest

+ (instancetype)guestWithName:(NSString *)name {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:delegate.managedObjectContext];
    
    guest.firstName = name;
    
    return guest;
}

@end
