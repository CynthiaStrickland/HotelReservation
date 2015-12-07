//
//  AvailabilityViewController.h
//  HotelManager
//
//  Created by Cynthia Whitlatch on 11/30/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "Hotel.h"
#import "Reservation.h"
#import "Guest.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic) Room *room;
@property (strong, nonatomic) NSDate *endDate;

@end
