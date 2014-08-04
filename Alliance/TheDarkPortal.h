//
//  TheDarkPortal.h
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REQUEST_MISSIONS @"misson/query"
#define REQUEST_MISSION @"order/pull"
#define COMMIT_MISSION_CONFIRM @"driver/confirm"
#define COMMIT_MISSION_STATUS @"order/changeDriverStatus"

@interface TheDarkPortal : NSObject
+(void) queryMissionsWithDriverID:(NSNumber*)driverID
                        onSucceed:(void(^) (NSMutableDictionary* response)) response
                        onFailure:(void(^) (NSMutableDictionary* status)) failure;


+(void) queryNewMissionWithDriverID:(NSString*)driverID
                            andDate:(NSString*)date
                          onSucceed:(void(^) (NSMutableDictionary* response)) response
                          onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(void) commitMissionConfirm:(NSString*)driverID
                  andOrderID:(NSString*)orderID
                   onSucceed:(void(^) (NSMutableDictionary* response)) response
                   onFailure:(void(^) (NSMutableDictionary* status)) failure;

enum OrderStatus {
    Status_Free,
    Status_Waiting,
    Status_Busy,
};

+(void) changeMissionStatus:(NSString*)orderID
                  andStatus:(enum OrderStatus) status
                  onSucceed:(void(^) (NSMutableDictionary* response)) response
                  onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method;
@end

#define MAKE_WITH_REQUEST(x) [[[TheDarkPortal makeUrlWithMethod:x] URL] absoluteString]