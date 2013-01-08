//
//  MHRequest.h
//  hAPI SDK
//
//  Created by Charles Fisher on 1/7/13.
//  Copyright (c) 2013 Medhelp International. All rights reserved.
//

#import <Foundation/Foundation.h>

enum MHHTTPRequestMethod {
    kPOST = 1,
    kPUT,
    kDELETE,
    kGET
};

@interface MHRequest : NSObject

@property (nonatomic, strong) NSString *endPoint;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, assign) enum MHHTTPRequestMethod method;

- (id) initWithEndPoint:(NSString*)endPoint;

- (id) start:(NSError**)error;

@end
