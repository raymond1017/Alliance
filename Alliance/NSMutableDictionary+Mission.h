//
//  NSMutableDictionary+Mission.h
//  Alliance
//
//  Created by junwen.wu on 14-7-25.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary(Mission)

-(NSArray*) mission_items;

-(NSString*) mission_item_time;
-(NSString*) mission_item_weather;
-(NSString*) mission_item_begin;
-(NSString*) mission_item_end;
-(NSString*) mission_item_cost;
@end
