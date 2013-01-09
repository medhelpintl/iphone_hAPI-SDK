//
//  NSDateFormatter+hAPI.m
//  hAPI SDK
//
//  Created by Charles Fisher on 1/9/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import "NSDateFormatter+hAPI.h"

@implementation NSDateFormatter (hAPI)

+ (NSDateFormatter*) hAPIDateFormatter
{
    static NSDateFormatter *__dateFormat;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __dateFormat = [[NSDateFormatter alloc] init];
        [__dateFormat setDateFormat:@"MM-dd-yyyy"];
    });
    return __dateFormat;
}

+ (NSDateFormatter*) iec958Formatter
{
    static NSDateFormatter *__dateFormat;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __dateFormat = [[NSDateFormatter alloc] init];
        [__dateFormat setDateFormat:@"yyyy-MM-dd"];
    });
    return __dateFormat;
}


@end
