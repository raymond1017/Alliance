//
//  MissionCell.m
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "MissionCell.h"
#import "NSMutableDictionary+Mission.h"

@implementation MissionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    int leftMargin = 40;
    int topMargin = 5;
    if (self) {
        // Initialization code
        
        UIView* background = [[UIView alloc] initWithFrame:self.contentView.bounds];
        
        UILabel* time = [[UILabel alloc] initWithFrame:CGRectMake(40, topMargin, 120, 20)];
        [time setText:T_("")];
//        UILabel* weather = [UI]
        [background addSubview:time];
//        [background addSubview:<#(UIView *)#>]
        
        [self.contentView addSubview:background];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
