//
//  MapVC.m
//  Alliance
//
//  Created by junwen.wu on 14-7-28.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "MapVC.h"
#import "TheDarkPortal.h"

@interface MapVC ()

@end

@implementation MapVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self navigationWithTitle:T_(@"Main_Map_Title") isHiddenBack:NO];
    
    UIImageView* image = IMAGEVIEW_SCALE(@"map0000");
    image.frame = self.container_body.bounds;
    [self.container_body addSubview:image];
    
    {
        UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.container_body.frame.size.width, 30)];
        [lab setText:T_(@"Main_Map_INFO1")];
        [lab setTextColor:RGB(100, 100, 100)];
        [lab setTextAlignment:NSTextAlignmentCenter];
        [lab setFont:[UIFont systemFontOfSize:22]];
        
        [self.container_body addSubview:lab];
    }
    {
        UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.container_body.frame.size.width, 50)];
        [lab setText:T_(@"Main_Map_Distant")];
        [lab setTextColor:RGB(202, 60, 28)];
        [lab setNumberOfLines:2];
        [lab setTextAlignment:NSTextAlignmentCenter];
        
        [self.container_body addSubview:lab];
    }
    {
        UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, self.container_body.frame.size.width, 30)];
        [lab setText:T_(@"Main_Map_Action")];        [lab setTextColor:RGB(100, 100, 100)];
        [lab setFont:[UIFont systemFontOfSize:12]];
        [lab setTextAlignment:NSTextAlignmentCenter];
        
        [self.container_body addSubview:lab];
    }
    
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.container_body.frame.size.height - 40, self.container_body.frame.size.width, 40)];
        [btn setTitle:T_(@"Main_Map_Arrived") forState:UIControlStateNormal];
        [btn setBackgroundColor:RGBA(0, 0, 0, 0.8)];
        [btn addTarget:self action:@selector(handleArrived:) forControlEvents:UIControlEventTouchUpInside];
        [self.container_body addSubview:btn];
    }
    
    {
        UIImageView* north = IMAGEVIEW_SCALE(@"启用导航");
        north.frame = CGRectMake(self.container_body.frame.size.width - north.image.size.width - 10, self.container_body.frame.size.height - north.image.size.height - 50, north.image.size.width, north.image.size.height);
        [self.container_body addSubview:north];
        
        UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, north.frame.size.width - 50, north.frame.size.height)];
        [lab setText:T_(@"Main_Map_Location")];
        [lab setFont:[UIFont systemFontOfSize:15]];
        [north addSubview:lab];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) handleArrived:(id)sender {
    [TheDarkPortal changeMissionStatus:self.orderID andStatus:Status_Waiting onSucceed:nil onFailure:nil];
}

@end
