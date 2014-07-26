//
//  OldCrafty.h
//  Alliance
//
//  Created by junwen.wu on 14-7-25.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OldCrafty : NSObject

+(NSMutableDictionary*) fakeRequestWithMethod:(NSString*)method
                             andRequestMethod:(NSMutableDictionary*)data;
@end
