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

@interface StratholmeVC ()

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
    
    item1.tabBarHeight = self.tabBar.frame.size.height;
    item2.tabBarHeight = self.tabBar.frame.size.height;
    
    item1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hello 1" image:nil selectedImage:nil];
    item2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hello 2" image:nil selectedImage:nil];
    
    [self addChildViewController:item1];
    [self addChildViewController:item2];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
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

@end
