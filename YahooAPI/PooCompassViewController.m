//
//  PooCompassViewController.m
//  YahooAPI
//
//  Created by crazypoo on 14-4-14.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooCompassViewController.h"
#import "PooGeoPointCompass.h"

@interface PooCompassViewController ()
@property (nonatomic, retain) PooGeoPointCompass *geoPointCompass;

@end

@implementation PooCompassViewController
@synthesize geoPointCompass = _geoPointCompass;

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    arrowImageView.image = [UIImage imageNamed:@"arrow.png"];
    [self.view addSubview:arrowImageView];
    
    _geoPointCompass = [[PooGeoPointCompass alloc] init];
    
    [_geoPointCompass setArrowImageView:arrowImageView];
    
    _geoPointCompass.latitudeOfTargetedPoint = 48.858093;
    _geoPointCompass.longitudeOfTargetedPoint = 2.294694;
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
