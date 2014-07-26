//
//  NSMutableDictionary+Mission.m
//  Alliance
//
//  Created by junwen.wu on 14-7-25.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Mission.h"

@implementation NSMutableDictionary(Mission)


-(NSArray*) mission_items {
    return [self objectForKey:@"items"];
}

-(NSString*) mission_item_time {
    return [self objectForKey:@"time"];
}

-(NSString*) mission_item_weather {
    return [self objectForKey:@"weather"];
}

-(NSString*) mission_item_begin {
    return [self objectForKey:@"begin"];
}

-(NSString*) mission_item_end {
    return [self objectForKey:@"end"];
}

-(NSString*) mission_item_cost {
    return [self objectForKey:@"cost"];
}

@end