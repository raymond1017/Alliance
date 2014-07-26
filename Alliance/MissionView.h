//
//  MissionView.h
//  Alliance
//
//  Created by junwen.wu on 14-7-26.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MissionDelegate <NSObject>

-(void) handleAcceptMission:(NSMutableDictionary*) mission;

@end

@interface MissionView : UIView

-(id)initWithFrame:(CGRect)frame
        andMission:(NSMutableDictionary*) mission;

@property (assign, nonatomic) id<MissionDelegate> missionDeleagate;
@end
