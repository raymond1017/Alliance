//
//  StratholmeVC.m
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "StratholmeVC.h"
#import "LivingSideVC.h"
#import "UndeadSideVC.h"
#import "UIView+Util.h"
#import "MissionView.h"
#import "TheDarkPortal.h"
#import "NSMutableDictionary+Mission.h"

@interface StratholmeVC () <MissionDelegate>
@property (strong, nonatomic) UIView* mission_background;

@property (strong, nonatomic) NSMutableArray* missions;

@property (weak, nonatomic) LivingSideVC* leftVC;
@property (weak, nonatomic) UndeadSideVC* rightVC;
@end

@implementation StratholmeVC

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
    // Do any additional setup after loading the view.
    
    LivingSideVC* item1 = [LivingSideVC new];
    UndeadSideVC* item2 = [UndeadSideVC new];
    
    self.leftVC = item1;
    self.rightVC = item2;
    
    item1.tabBarHeight = self.tabBar.frame.size.height;
    item2.tabBarHeight = self.tabBar.frame.size.height;
    
    item1.tabBarItem = [[UITabBarItem alloc] initWithTitle:T_(@"Main_Tab_Mission") image:IMAGE_SCALE(@"待办") selectedImage:nil];
    item2.tabBarItem = [[UITabBarItem alloc] initWithTitle:T_(@"Main_Tab_Self") image:IMAGE_SCALE(@"我的_normal") selectedImage:nil];
    
    [self addChildViewController:item1];
    [self addChildViewController:item2];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    
    NSMutableDictionary* dict = [NSMutableDictionary new];
    [dict setValue:@"hello" forKey:@"test"];
    
    self.missions = [NSMutableArray new];
    
    
    [self timerRequest];
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


-(void) timerRequest {
    int64_t delay = 2.0f;
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    
    dispatch_after(timer, dispatch_get_main_queue(), ^(void){
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            NSString* date = @"2014-07-21 21:16:12";
            if([self.missions count] > 0){
                date = [[self.missions lastObject] mission_item_time];
            }
            [TheDarkPortal queryNewMissionWithDriverID:@"1" andDate:date onSucceed:^(NSMutableDictionary* succeed){
                do{
                    if([self.missions count] < 1){
                        [self.missions addObjectsFromArray:[succeed mission_items]];
                        break;
                    }
                    [self.missions addObjectsFromArray:[succeed mission_items]];
                    
                    if([[succeed mission_items] count] < 1){
                        break;
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        
                        NSMutableDictionary* dict = [[succeed mission_items] lastObject];
                        
                        MissionView* mission = [[MissionView alloc] initWithFrame:self.view.bounds andMission:dict];
                        [self.view addSubview:mission];
                        mission.missionDeleagate = self;
                    });
                    
                    
                }while (false);
                [self timerRequest];
                
                
            }onFailure:^(NSMutableDictionary* status) {
                [self timerRequest];
            }];
            
            
        });
    });
}


// lock direction
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationMaskPortrait);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark - handler mission

-(void) handleAcceptMission:(NSMutableDictionary *)mission {
    
    NSMutableDictionary* dict = [NSMutableDictionary new];
    [dict setObject:@"08:50" forKey:@"orderTime"];
    [dict setObject:@"20℃" forKey:@"weather"];
    [dict setObject:T_(@"Airport_1") forKey:@"begin"];
    [dict setObject:T_(@"" ) forKey:@"end"];
    [dict setObject:@"960" forKey:@"cost"];
    [dict setObject:[mission mission_id] forKey:@"orderId"];
    
    [self.leftVC appendMission:dict];
    
    [TheDarkPortal commitMissionConfirm:[mission mission_item_time] andOrderID:[mission mission_id] onSucceed:^(NSMutableDictionary* succeed){
        
    }onFailure:^(NSMutableDictionary* status){
        
    }];
}
@end
