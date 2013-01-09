//
//  NSDate+hAPI.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/8/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "NSDate+hAPI.h"

@implementation NSDate (hAPI)

- (NSDate*) midnight
{
    NSDateComponents *todayComps = [[NSCalendar currentCalendar] components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekdayCalendarUnit) fromDate:self];
    return [[NSCalendar currentCalendar] dateFromComponents: todayComps];
}

@end
