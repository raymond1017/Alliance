//
//  LivingSideVC.m
//  Alliance
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "LivingSideVC.h"
#import "MissionCell.h"
#import "TheDarkPortal.h"
#import "NSMutableDictionary+Mission.h"

@interface LivingSideVC ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray* array;
@property (weak, nonatomic) UITableView* tableView;
@end

@implementation LivingSideVC

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
    
    [self navigationWithTitle:T_(@"Application_Name") isHiddenBack:YES];
    
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.container_body.bounds];
    [self.container_body addSubview:scrollview];
    UIView* container = scrollview;
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    {
        UITableView* table = [[UITableView alloc] initWithFrame:container.bounds];
        
        table.dataSource = self;
        table.delegate = self;
        self.tableView = table;
        [container addSubview:table];
    }
    
    [TheDarkPortal queryMissionsWithDriverID:[NSNumber numberWithInt:0] onSucceed:^(NSMutableDictionary* succeed){
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.array = [succeed mission_items];
            [self.tableView reloadData];
        });
        
    } onFailure:^(NSMutableDictionary* status){
        
    }];
    
    self.array = [NSMutableArray new];
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

#pragma mark - TableView delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    
//    NSMutableDictionary* dict = [self.array objectAtIndex:index];
    //    [self performSegueWithIdentifier:@"goPoiDetail" sender:dict];
    
    //    if([dict poicard_traffic] == nil){
    //        return;
    //    }
    //
    //    PoiDetailVC* vc = [PoiDetailVC new];
    //    vc.poiCardItem = dict;
    //    [self presentViewController:vc animated:YES completion:^(void){
    //
    //    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"itemCell";
    
    NSInteger index = indexPath.row;
//    NSArray* pairItem = [self.array objectAtIndex:index];
    
    MissionCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[MissionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
//    [cell setStorageItems:pairItem];
    return cell;
}
@end
