//
//  MissionCell.m
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "MissionCell.h"
#import "UIView+Util.h"
#import "UILabel+Util.h"
#import "UIHelper.h"
#import "NSMutableDictionary+Mission.h"
#import "TheDarkPortal.h"

@interface MissionCell()
@property (weak, nonatomic) UILabel* timeDetail;
@property (weak, nonatomic) UILabel* weatherDetail;

@property (weak, nonatomic) UILabel* startPoint;
@property (weak, nonatomic) UILabel* endPoint;

@property (weak, nonatomic) UILabel* bill;

@property (weak, nonatomic) UIButton* btnLeft;
@property (weak, nonatomic) UIButton* btnRight;
@end

@implementation MissionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    int leftMargin = 40;
    int topMargin = 12;
    if (self) {
        // Initialization code
        UIFont* font = [UIFont systemFontOfSize:14];
//        [self.contentView setFrame:CGRectMake(0, 0, self.contentView.frame.size.width, CELL_HEIGHT)];
        
        UIView* shadow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, CELL_HEIGHT-20)];
        [shadow.layer setMasksToBounds:YES];
        [shadow.layer setCornerRadius:1];
        [shadow.layer setBorderColor:[RGBA(200, 200, 200, 0.5) CGColor]];
        [shadow.layer setBorderWidth:1.0f];
//        [shadow.layer setShadowColor:[RGBA(200, 200, 200, 0.8) CGColor]];
//        [shadow.layer setShadowOffset:CGSizeMake(0, -1)];
//        [shadow.layer setShadowOpacity:1];
//        [shadow.layer setShadowRadius:2.0];
        
        [self setBackgroundColor:[UIColor clearColor]];
        UIView* background = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.contentView.bounds.size.width, CELL_HEIGHT-20)];
        [background addSubview:shadow];
        [background setBackgroundColor:[UIColor whiteColor]];
        
        UIImageView* type = IMAGEVIEW_SCALE(@"预约用车");
        type.frame = CGRectMake(0, 1, type.image.size.width, type.image.size.height);
        [background addSubview:type];
        
        UIView* border = [[UIView alloc] initWithFrame:CGRectMake(0, 0, background.frame.size.width, 40)];
        [border.layer setBorderColor:[RGBA(200, 200, 200, 0.5) CGColor]];
        [border.layer setBorderWidth:1.0f];
//        [border.layer setShadowColor:[RGBA(200, 200, 200, 0.8) CGColor]];
//        [border.layer setShadowOffset:CGSizeMake(0, -1)];
//        [border.layer setShadowOpacity:1];
//        [border.layer setShadowRadius:2.0];
        [background addSubview:border];
        
        UILabel* time = [[UILabel alloc] initWithFrame:CGRectMake(50, topMargin, 60, 20)];
        [time setText:T_(@"Main_Cell_Time")];
        [time setFont:font];
//        [time setBackgroundColor:[UIColor redColor]];
        [background addSubview:time];
        
        UILabel* timeDetail = [UILabel new];
        timeDetail.frame = [UIHelper rightTo:time.frame margin:0 width:60 height:20];
//        [timeDetail setBackgroundColor:[UIColor yellowColor]];
        [timeDetail setText:@"08:50"];
        [timeDetail setFont:font];
        
        self.timeDetail = timeDetail;
        [background addSubview:timeDetail];
        
        UIImageView* weather = IMAGEVIEW_SCALE(@"雷阵雨");
        weather.frame = CGRectMake(background.frame.size.width - 110, 10, weather.image.size.width, weather.image.size.height);
//        [weather setBackgroundColor:[UIColor grayColor]];
        [background addSubview:weather];
        
        UILabel* label = [UILabel new];
        label.frame = CGRectMake(background.frame.size.width - 70, 12, 60, 20);
        [label setText:@"20℃"];
        [label setFont:font];
        
        self.weatherDetail = label;
        [background addSubview:label];
        
        {
            UIImageView* point = IMAGEVIEW_SCALE(@"起点");
            point.frame = CGRectMake(20, 55, point.image.size.width, point.image.size.height);
            [background addSubview:point];
            
            UILabel* lab = [UILabel new];
            lab.frame = CGRectMake(40, 50, 250, 20);
//            [lab setBackgroundColor:[UIColor redColor]];
            [background addSubview:lab];
            
            self.startPoint = lab;
        }
        
        {
            UIImageView* point = IMAGEVIEW_SCALE(@"终点");
            point.frame = CGRectMake(20, 85, point.image.size.width, point.image.size.height);
            [background addSubview:point];
            
            UILabel* lab = [UILabel new];
            lab.frame = CGRectMake(40, 80, 250, 20);
//            [lab setBackgroundColor:[UIColor redColor]];
            [background addSubview:lab];
            
            self.endPoint = lab;
        }
        {
            UILabel* cost = [UILabel new];
            [cost setFrame:CGRectMake(leftMargin, 105, 100, 30)];
//            [cost setBackgroundColor:[UIColor blackColor]];
            [cost setTextColor:[UIColor colorWithRed:255.0/255.0 green:175.0/255.0 blue:37.0/255.0 alpha:1.0]];
            [cost setText:T_(@"Main_Cell_Bill")];
            
            UILabel* bill = [UILabel new];
            [bill setFrame:[UIHelper rightTo:cost.frame margin:5 width:120 height:30]];
            //            [bill setText:@"350"];
            [bill setTextColor:[UIColor colorWithRed:255.0/255.0 green:175.0/255.0 blue:37.0/255.0 alpha:1.0]];
            self.bill = bill;
            [background addSubview:bill];
            [background addSubview:cost];
        }
        int btnHeight = 30;
        int btnMargin = 10;
        int btnWidth = 140;
        {
            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(13, 140, btnWidth, btnHeight)];
            [btn setTitle:T_(@"Main_Cell_Status_Confirm") forState:UIControlStateNormal];
//            [btn setBackgroundColor:[UIColor redColor]];
            [btn setBackgroundImage:IMAGE_SCALE(@"我已出发") forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [btn addTarget:self action:@selector(handleStart:) forControlEvents:UIControlEventTouchUpInside];
            [background addSubview:btn];
         
            self.btnLeft = btn;
        }
        {
            UIButton* btn = [UIButton new];
            [btn setFrame:CGRectMake(165, 140, btnWidth, btnHeight)];
            [btn setTitle:T_(@"Main_Cell_ViewCheckPoint") forState:UIControlStateNormal];
            [btn setBackgroundImage:IMAGE_SCALE(@"查看导航") forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [background addSubview:btn];
            
            UIImageView* img = IMAGEVIEW_SCALE(@"查看导航_方向");
            img.frame = CGRectMake(btn.frame.size.width - img.image.size.width - 5, 7, img.image.size.width, img.image.size.height);
            [btn addSubview:img];
            [btn addTarget:self action:@selector(handleDetail:) forControlEvents:UIControlEventTouchUpInside];
            
            self.btnRight = btn;
        }
//        [self.contentView setFrame:CGRectMake(0, 0, self.contentView.frame.size.width, CELL_HEIGHT)];
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

- (void)setMission:(NSMutableDictionary *)mission {
    _mission = mission;
    [self.timeDetail setText:[mission mission_item_time]];
    [self.weatherDetail setText:[mission mission_item_weather]];
    
    [self.startPoint setText:[mission mission_item_begin]];
    [self.endPoint setText:[mission mission_item_end]];
    
    [self.bill setText:[mission mission_item_cost]];
}

- (void) handleStart:(id)sender {
    UIButton* btn = (UIButton*)sender;
    [btn setTitle:T_(@"Main_Cell_Status_Arrived") forState:UIControlStateNormal];
    [btn setBackgroundImage:IMAGE_SCALE(@"查看导航") forState:UIControlStateNormal];
 
    [self.mission mission_id];
    if([self.mission mission_id] == nil)
        return;
    [TheDarkPortal changeMissionStatus:[self.mission mission_id] andStatus:Status_Busy onSucceed:nil onFailure:nil ];
}

- (void) handleDetail:(id)sender {
    [self.missionDelegate handleMissionCellDetail:self.mission];
}


@end
