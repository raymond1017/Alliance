//
//  MissionView.m
//  Alliance
//
//  Created by junwen.wu on 14-7-26.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "MissionView.h"
#import "UIView+Util.h"
#import "NSMutableDictionary+Mission.h"

@interface MissionView()
@property (weak, nonatomic) UIView* mission_background;
@property (strong, nonatomic) NSMutableDictionary* mission;
@end

@implementation MissionView

- (id)initWithFrame:(CGRect)frame
         andMission:(NSMutableDictionary*) mission;
{
    self.mission = mission;
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView* missionBackground = [[UIImageView alloc] initWithFrame:frame];
        [missionBackground setImage:IMAGE_SCALE(@"bg")];
        [missionBackground setBackgroundColor:RGBA(200, 200, 200, 0.8)];
        [self addSubview:missionBackground];
        
        self.mission_background = missionBackground;
        
        self.mission_background.userInteractionEnabled = YES;
        
        
        int leftMargin = 20;
        int topMargin = 30;
        UIImageView* missionDetail = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin, 0 - 400, missionBackground.frame.size.width - leftMargin*2, 410)];
        self.mission_background = missionDetail;
        [missionDetail setImage:IMAGE_SCALE(@"订单提示")];
        {
            UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, missionDetail.frame.size.width, 24)];
            [label1 setText:@"一段文字1"];
            [label1 setTextAlignment:NSTextAlignmentCenter];
            [label1 setTextColor:[UIColor whiteColor]];
            [missionDetail addSubview:label1];
        }
        {
            UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, missionDetail.frame.size.width, 24)];
            [label1 setText:@"一段文字1"];
            [label1 setTextAlignment:NSTextAlignmentCenter];
            [label1 setTextColor:[UIColor whiteColor]];
            [label1 setFont:[UIFont boldSystemFontOfSize:22]];
            [missionDetail addSubview:label1];
        }
        {
            UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, missionDetail.frame.size.width, 24)];
            [label1 setText:@"一段文字1"];
            [label1 setTextAlignment:NSTextAlignmentCenter];
            [label1 setTextColor:[UIColor whiteColor]];
            [missionDetail addSubview:label1];
        }
        {
            UIImageView* imageView = IMAGEVIEW_SCALE(@"起点_订单提示");
            [imageView setFrame:CGRectMake(missionDetail.frame.size.width / 2 - imageView.image.size.width / 2, 150, imageView.image.size.width, imageView.image.size.height)];
            [missionDetail addSubview:imageView];
            
            UILabel* tip = [[UILabel alloc] initWithFrame:imageView.frame];
            [tip setText:T_(@"Main_Mission_Start")];
            [tip setTextAlignment:NSTextAlignmentCenter];
            [tip setFont:[UIFont systemFontOfSize:12]];
            [tip setTextColor:[UIColor whiteColor]];
            [missionDetail addSubview:tip];
            
            UILabel* startPoint = [UILabel new];
            startPoint.frame = CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + 10, missionDetail.frame.size.width, 25);
            [startPoint setTextAlignment:NSTextAlignmentCenter];
            [startPoint setText:[mission mission_item_begin]];
            
            [missionDetail addSubview:startPoint];
        }
        {
            UIImageView* imageView = IMAGEVIEW_SCALE(@"终点_订单提示");
            [imageView setFrame:CGRectMake(missionDetail.frame.size.width / 2 - imageView.image.size.width / 2, 220, imageView.image.size.width, imageView.image.size.height)];
            [missionDetail addSubview:imageView];
            
            UILabel* tip = [[UILabel alloc] initWithFrame:imageView.frame];
            [tip setText:T_(@"Main_Mission_End")];
            [tip setTextAlignment:NSTextAlignmentCenter];
            [tip setFont:[UIFont systemFontOfSize:12]];
            [tip setTextColor:[UIColor whiteColor]];
            [missionDetail addSubview:tip];
            
            UILabel* startPoint = [UILabel new];
            startPoint.frame = CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + 10, missionDetail.frame.size.width, 25);
            [startPoint setTextAlignment:NSTextAlignmentCenter];
            [startPoint setText:[mission mission_item_end]];
            
            [missionDetail addSubview:startPoint];
        }
        
        [missionBackground addSubview:missionDetail];
        
        [UIView animateWithDuration:0.4 animations:^{
            missionDetail.frame = CGRectMake(leftMargin, topMargin, missionBackground.frame.size.width - leftMargin*2, 400);
        } completion:^(BOOL finished){
            if(finished){
                UIImage* mid = IMAGE_SCALE(@"抢单");
                UIImage* right = IMAGE_SCALE(@"返回");
                int offset = 24;
                {
                    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(10, missionDetail.frame.origin.y + missionDetail.frame.size.height + offset, right.size.width, right.size.height)];
                    [btn setBackgroundImage:right forState:UIControlStateNormal];
                    [missionBackground addSubview:btn];
                }
                {
                    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake((missionBackground.frame.size.width - mid.size.width) / 2, missionDetail.frame.origin.y + missionDetail.frame.size.height + 10, mid.size.width, mid.size.height)];
                    [btn setBackgroundImage:mid forState:UIControlStateNormal];
                    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
                    
                    [btn setTitle:T_(@"Main_Mission_Accept") forState:UIControlStateNormal];
                    [missionBackground addSubview:btn];
                    
                    //                [btn setValue:mission forKey:@"mission"];
                    
                    [btn addTarget:self action:@selector(handleAccept:) forControlEvents:UIControlEventTouchUpInside];
                }
                {
                    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(missionBackground.frame.size.width - right.size.width - 10, missionDetail.frame.origin.y + missionDetail.frame.size.height + offset, right.size.width, right.size.height)];
                    [btn setBackgroundImage:right forState:UIControlStateNormal];
                    
                    [btn setTitle:T_(@"Main_Mission_Back") forState:UIControlStateNormal];
                    [missionBackground addSubview:btn];
                    
                    [btn addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
                }
            }
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) handleBack:(id)sender {
    CGRect nowFrame = self.mission_background.frame;
    CGRect rect = CGRectMake(nowFrame.origin.x, 0 - nowFrame.size.height, nowFrame.size.width, nowFrame.size.height);
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        self.mission_background.frame = rect;
        self.alpha = 0;
    } completion:^(BOOL finished){
        if(finished){
            [self removeFromSuperview];
        }
    }];
}

-(void) handleAccept:(id)sender {
    if(self.missionDeleagate == nil)
        return;
    
    [self.missionDeleagate handleAcceptMission:self.mission];
    
    [self handleBack:sender];
}

@end
