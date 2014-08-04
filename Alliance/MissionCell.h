//
//  MissionCell.h
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_HEIGHT 200

@protocol MissionCellDelegate <NSObject>
-(void) handleMissionCellDetail:(NSMutableDictionary*) mission;

@end


@interface MissionCell : UITableViewCell
@property (strong, nonatomic) NSMutableDictionary* mission;

@property (assign, nonatomic) id<MissionCellDelegate> missionDelegate;
@end
