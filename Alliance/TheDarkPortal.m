//
//  TheDarkPortal.m
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TheDarkPortal.h"
#import "Orgrimar.h"
#import "OldCrafty.h"


@implementation TheDarkPortal
//fake service
+ (void) executeRequest:(NSMutableURLRequest*) request
            requestData:(NSMutableDictionary*) requestData
              onSucceed:(void(^) (NSMutableDictionary* response)) onSucceed
              onFailure:(void(^) (NSMutableDictionary* response)) onFailure{
    
    NSMutableDictionary* dict = [OldCrafty fakeRequestWithMethod:[[request URL] absoluteString] andRequestMethod:requestData];
    onSucceed(dict);
}

+(void) queryMissionsWithDriverID:(NSNumber*)driverID
                        onSucceed:(void(^) (NSMutableDictionary* response)) response
                        onFailure:(void(^) (NSMutableDictionary* status)) failure {
    
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [self executeRequest:[TheDarkPortal makeUrlWithMethod:REQUEST_MISSIONS] requestData:reqData onSucceed:response onFailure:failure];
}


+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method {
    return [[NSMutableURLRequest alloc] initWithURL: [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@/%@", sAppSetting.HOST, method]]];
}
@end
