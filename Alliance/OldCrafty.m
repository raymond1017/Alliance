//
//  OldCrafty.m
//  Alliance
//
//  Created by junwen.wu on 14-7-25.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "OldCrafty.h"
#import "TheDarkPortal.h"

@implementation OldCrafty

+(NSMutableDictionary*) fakeRequestWithMethod:(NSString*)method
                             andRequestMethod:(NSMutableDictionary*)data {
    if([method isEqualToString: MAKE_WITH_REQUEST(REQUEST_MISSIONS)] ){
        NSMutableDictionary* resp = [NSMutableDictionary new];
        {
            NSMutableArray* items = [NSMutableArray new];
            
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                [dict setObject:@"08:50" forKey:@"time"];
                [dict setObject:@"20" forKey:@"weather"];
                [dict setObject:@"123123" forKey:@"begin"];
                [dict setObject:@"123123" forKey:@"end"];
                [dict setObject:@"960" forKey:@"cost"];
                [items addObject:dict];
            }
            
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                [dict setObject:@"08:50" forKey:@"time"];
                [dict setObject:@"20" forKey:@"weather"];
                [dict setObject:@"123123" forKey:@"begin"];
                [dict setObject:@"123123" forKey:@"end"];
                [dict setObject:@"960" forKey:@"cost"];
                [items addObject:dict];
            }
            
            [resp setObject:items forKey:@"items"];
        }
        
        return resp;
    } else {
        
    }
    
    return nil;
}

@end
