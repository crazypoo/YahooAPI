//
//  PooWeatherInfoViewController.m
//  YahooAPI
//
//  Created by crazypoo on 14-4-10.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooWeatherInfoViewController.h"

@interface PooWeatherInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *infoTabel;

@end

@implementation PooWeatherInfoViewController
@synthesize infoTabel = _infoTabel;


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
    self.title = @"WeatherINFO";
    // Do any additional setup after loading the view.
    
    self.infoTabel = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.infoTabel.backgroundColor = [UIColor lightGrayColor];
    [self.infoTabel setSeparatorColor:[UIColor purpleColor]];
    self.infoTabel.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.infoTabel.dataSource = self;
    self.infoTabel.delegate = self;
    [self.view addSubview:self.self.infoTabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -about tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if (_dataArr) {
        
        
        PooCityModel * cityM = (PooCityModel *) _dataArr;
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = [NSString stringWithFormat:@"Title:"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",cityM.items_Title];
        }
        
        if (indexPath.row == 1)
        {
            cell.textLabel.text = [NSString stringWithFormat:@"Date:"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",cityM.items_pubDate];
        }
        
        if (indexPath.row == 2)
            cell.textLabel.text = [NSString stringWithFormat:@"Temperature: %@",[cityM.items_Condition_Dict valueForKey:@"temp"]];
        
        if (indexPath.row == 3)
            cell.textLabel.text = [NSString stringWithFormat:@"Desc: %@",[cityM.items_Condition_Dict valueForKey:@"text"]];
        
        
        if (indexPath.row == 4)
        {
            cell.textLabel.text = [NSString stringWithFormat:@"Forecast"];
            [cell.textLabel setFont:[UIFont boldSystemFontOfSize:19]];
        }
        
        
        if (indexPath.row == 5)
        {
            
            NSDictionary * forecast  = [cityM.items_Forecast_Array objectAtIndex:0];
            
            NSDate * date = [forecast valueForKey:@"date"];
            
            cell.textLabel.text = [NSString stringWithFormat:@"  Date: %@ ",date];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"  Desc: %@",[forecast valueForKey:@"text"]];
            
        }
        
        if (indexPath.row == 6)
        {
            
            
            NSDictionary * forecast  = [cityM.items_Forecast_Array objectAtIndex:1];
            
            NSDate * date = [forecast valueForKey:@"date"];
            
            cell.textLabel.text = [NSString stringWithFormat:@"  Date: %@ ",date];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"  Desc: %@",[forecast valueForKey:@"text"]];
        }
        
        if (indexPath.row == 7)
        {
            NSDictionary * forecast  = [cityM.items_Forecast_Array objectAtIndex:2];
            
            NSDate * date = [forecast valueForKey:@"date"];
            
            cell.textLabel.text = [NSString stringWithFormat:@"  Date: %@ ",date];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"  Desc: %@",[forecast valueForKey:@"text"]];
        }
        
        
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
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
