//
//  MHUtil.h
//  MedTracker
//
//  Created by Charles Fisher on 8/10/12.
//
//

#import <Foundation/Foundation.h>

@interface MHUtil : NSObject

+ (NSString*) appName;
+ (NSString*) appVersion;
+ (NSString*) macAddress;
+ (NSArray*) urlSchemes;
+ (NSString*) urlScheme;
@end
