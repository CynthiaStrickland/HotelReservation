//
//  Hotel+CoreDataProperties.h
//  HotelReservation
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Hotel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hotel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *hotelName;
@property (nullable, nonatomic, retain) NSNumber *stars;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *rooms;

@end

@interface Hotel (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(NSManagedObject *)value;
- (void)removeRoomsObject:(NSManagedObject *)value;
- (void)addRooms:(NSSet<NSManagedObject *> *)values;
- (void)removeRooms:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
