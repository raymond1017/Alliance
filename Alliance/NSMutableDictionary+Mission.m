//
//  NSMutableDictionary+Mission.m
//  Alliance
//
//  Created by junwen.wu on 14-7-25.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Mission.h"

@implementation NSMutableDictionary(Mission)


-(NSMutableArray*) mission_items {
    return [self objectForKey:@"orders"];
}

-(NSString*) mission_id {
    return [self objectForKey:@"orderId"];
}

-(NSString*) mission_item_time {
    return [self objectForKey:@"orderTime"];
}

-(NSString*) mission_item_weather {
    return [self objectForKey:@"weather"];
}

-(NSString*) mission_item_begin {
    
//    [dict setObject:@"曼谷素万那普机场" forKey:@"begin"];
//    [dict setObject:@"曼谷莲花大酒店" forKey:@"end"];
    
    return @"曼谷素万那普机场";
//    return [self objectForKey:@"begin"];
}

-(NSString*) mission_item_end {
    
    return @"曼谷莲花大酒店";
//    return [self objectForKey:@"end"];
}

-(NSString*) mission_item_cost {
    return [self objectForKey:@"cost"];
}

@end
