//
//  PooViewController.m
//  YahooAPI
//
//  Created by crazypoo on 14-4-10.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooViewController.h"
#import "PooWeatherForecastDataFetcher.h"
#import "PooAppDelegate.h"
#import "PooWeatherInfoTableViewCell.h"
#import "PooWeatherInfoViewController.h"
#import "PooCompassViewController.h"

@interface PooViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,PooWeatherForecastDataFetcherDelegate>
{
    PooAppDelegate *app;
}
@property (nonatomic, retain) UITextField *inputCity;
@property (nonatomic, retain) UITableView *tableOfName;
@property (nonatomic, retain) UIButton *dropButton;
@property (nonatomic, retain) PooWeatherForecastDataFetcher * weatherDF;
@property (nonatomic, retain) NSMutableArray * cityInfoArr;


@end

@implementation PooViewController
@synthesize inputCity = _inputCity;
@synthesize tableOfName = _tableOfName;
@synthesize weatherDF = _weatherDF;
@synthesize dropButton = _dropButton;
@synthesize cityInfoArr = _cityInfoArr;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"YahooAPI";
    
    UIButton* btnBack = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btnBack.frame = CGRectMake(0, 8, 51.5, 27.5);
    [btnBack addTarget:self action:@selector(compass) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.inputCity = [[UITextField alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, 40)];
    self.inputCity.placeholder = @"請輸入城市英文";
    self.inputCity.returnKeyType = UIReturnKeyDone;
    self.inputCity.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.inputCity.backgroundColor = [UIColor purpleColor];
    self.inputCity.keyboardType = UIKeyboardTypeWebSearch;
    self.inputCity.delegate = self;
    [self.view addSubview:self.inputCity];
    
    self.tableOfName = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-100) style:UITableViewStylePlain];
    self.tableOfName.backgroundColor = [UIColor lightGrayColor];
    [self.tableOfName setSeparatorColor:[UIColor purpleColor]];
    self.tableOfName.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableOfName.dataSource = self;
    self.tableOfName.delegate = self;
    [self.view addSubview:self.self.tableOfName];
    
    self.weatherDF = [[PooWeatherForecastDataFetcher alloc] init];
    [self.weatherDF setDelegate:self];
    
    app = WAAppDelegate;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.inputCity resignFirstResponder];
    if (([self.inputCity.text isEqualToString:@""])) {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Please enter city names" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    NSArray* cityNameArray = [self.inputCity.text componentsSeparatedByString: @","];
    [self getWeatherforCitys:cityNameArray];
    [self.inputCity resignFirstResponder];
    [app showHUDActivityIndicator:@"Fetching data..."];
    
    return YES;
}


#pragma mark -about tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cityInfoArr count];
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
    
    static NSString *cellIdentifier = @"WListCustomCell";
    PooWeatherInfoTableViewCell *cell = (PooWeatherInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[PooWeatherInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    PooCityModel * cityM = (PooCityModel *) [self.cityInfoArr objectAtIndex:indexPath.row];
    cell.cityLabel.text = cityM.cityName;
    cell.tempLabel.text = [NSString stringWithFormat:@"Temp: %@",[cityM.mainDict valueForKey:@"temp"]];

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
    PooCityModel * cityM = (PooCityModel *) [self.cityInfoArr objectAtIndex:indexPath.row];
    PooWeatherInfoViewController * detailVC = [[PooWeatherInfoViewController alloc] init];
    [detailVC setTitle:cityM.cityName];
    detailVC.dataArr = [self.cityInfoArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Fetch City info
- (void) getWeatherforCitys : (NSArray *) cityArr
{
    if (self.cityInfoArr) {
        self.cityInfoArr = nil;
    }
    self.cityInfoArr = [[NSMutableArray alloc] init];
    
    if ([cityArr count] > 0) {
        [self.weatherDF setIsDownloading:YES];
        
        for (int i = 0; i <[cityArr count]; i++) {
            NSString * str = [cityArr objectAtIndex:i];
            [self.weatherDF getWeatherHistoryForCity:str];
        }
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No City Name Entered" message:@"Please enter city name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        [app hideHUDActivityIndicator];
    }
}

#pragma mark - WeatherForecastDataFetcherDelegate

- (void) setCityWeatherInfo:(PooCityModel *)cityM
{
    if (cityM) {
        PooCityModel * cityTemp = [[PooCityModel alloc] init];
        cityTemp = cityM;
        cityTemp.mainDict = cityM.mainDict;
        [self.cityInfoArr addObject:cityTemp];
        
        NSLog(@"CityArray %@",self.cityInfoArr.description);
        [self.tableOfName reloadData];
    }
    [app hideHUDActivityIndicator];
}

- (void) errorNotification:(NSString *)errorMsg
{
    [app hideHUDActivityIndicator];
}

#pragma mark -----------------------button action
-(void)compass
{
    PooCompassViewController *compass = [[PooCompassViewController alloc] init];
    [self.navigationController pushViewController:compass animated:YES];
}
@end
