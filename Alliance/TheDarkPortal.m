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
#import "NSMutableDictionary+Response.h"


@implementation TheDarkPortal
//fake service
+ (void) executeFakeRequest:(NSMutableURLRequest*) request
            requestData:(NSMutableDictionary*) requestData
              onSucceed:(void(^) (NSMutableDictionary* response)) onSucceed
              onFailure:(void(^) (NSMutableDictionary* response)) onFailure{
    
    NSMutableDictionary* dict = [OldCrafty fakeRequestWithMethod:[[request URL] absoluteString] andRequestMethod:requestData];
    onSucceed(dict);
}

+ (NSString*) makeHttpPost:(NSMutableDictionary*)dict {
    NSMutableString* ret = [NSMutableString new];
    for (NSString* keys in dict.keyEnumerator) {
        [ret appendFormat:@"%@=%@&", keys, [dict objectForKey:keys]];
        
    }
    
    return ret;
}

+ (void) executeRequest:(NSMutableURLRequest*) request
            requestData:(NSMutableDictionary*) requestData
              onSucceed:(void(^) (NSMutableDictionary* response)) onSucceed
              onFailure:(void(^) (NSMutableDictionary* response)) onFailure{
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"content-type"];//请求头
    //    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:requestData options:NSJSONWritingPrettyPrinted error:nil]];
    [request setHTTPBody:[[TheDarkPortal makeHttpPost:requestData] dataUsingEncoding:NSStringEncodingConversionAllowLossy]];
    
    NSError* error = [[NSError alloc] init];
    [request setTimeoutInterval:5.0];
    NSData* resp = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    NSInteger errorCode = [error code];
    
    if(errorCode != 0){
        
        NSLog(@"Http Request Fail Request: %@ HttpCode: %ld Domain: %@", [request.URL absoluteString], errorCode, [error domain]);
        onFailure(nil);
        return;
    }
    
    NSMutableDictionary* responseData = [NSJSONSerialization JSONObjectWithData:resp options:NSJSONReadingMutableLeaves error:nil];
    
    NSNumber* code = [NSNumber numberWithLong:100500];
    NSString* desc = @"服务器异常返回";
    do{
        NSDictionary* status = [responseData response_status];
        if(status == nil){
            break;
        }
        code = [status objectForKey:@"code"];
        if(code == nil){
            break;
        }
        
        desc = [status objectForKey:@"desc"];
        
        if([code integerValue] != 200){
            break;
        }
        
        onSucceed([responseData response_business]);
        return;
    }while (false);
    
    NSLog(@"Http Request Fail Request: %@ RespCode: %@ Desc: %@", [request.URL absoluteString], code, desc);
    
    onFailure([responseData response_status]);
}

+(void) queryMissionsWithDriverID:(NSNumber*)driverID
                        onSucceed:(void(^) (NSMutableDictionary* response)) response
                        onFailure:(void(^) (NSMutableDictionary* status)) failure {
    
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [self executeFakeRequest:[TheDarkPortal makeUrlWithMethod:REQUEST_MISSIONS] requestData:reqData onSucceed:response onFailure:failure];
}

+(void) queryNewMissionWithDriverID:(NSString*)driverID
                            andDate:(NSString*)date
                          onSucceed:(void(^) (NSMutableDictionary* response)) response
                          onFailure:(void(^) (NSMutableDictionary* status)) failure {
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [reqData setObject:driverID forKey:@"driverId"];
    [reqData setObject:date forKey:@"beginTime"];
    [self executeRequest:[TheDarkPortal makeUrlWithMethod:REQUEST_MISSION] requestData:reqData onSucceed:response onFailure:failure];
}


+(void) commitMissionConfirm:(NSString*)driverID
                  andOrderID:(NSString*)orderID
                   onSucceed:(void(^) (NSMutableDictionary* response)) response
                   onFailure:(void(^) (NSMutableDictionary* status)) failure {
    
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [reqData setObject:driverID forKey:@"driverId"];
    [reqData setObject:orderID forKey:@"orderId"];
    [self executeRequest:[TheDarkPortal makeUrlWithMethod:COMMIT_MISSION_CONFIRM] requestData:reqData onSucceed:response onFailure:failure];
}

+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method {
    return [[NSMutableURLRequest alloc] initWithURL: [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@/%@", sAppSetting.HOST, method]]];
}
@end
