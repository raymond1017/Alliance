//
//  TheDarkPortal.h
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REQUEST_MISSIONS @"misson/query"

@interface TheDarkPortal : NSObject
+(void) queryMissionsWithDriverID:(NSNumber*)driverID
                        onSucceed:(void(^) (NSMutableDictionary* response)) response
                        onFailure:(void(^) (NSMutableDictionary* status)) failure;


+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method;
@end

#define MAKE_WITH_REQUEST(x) [[[TheDarkPortal makeUrlWithMethod:x] URL] absoluteString]