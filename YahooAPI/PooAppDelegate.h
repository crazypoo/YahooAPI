//
//  PooAppDelegate.h
//  YahooAPI
//
//  Created by crazypoo on 14-4-10.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PooViewController.h"
#import "MBProgressHUD.h"

@interface PooAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) PooViewController *viewController;
@property (strong, nonatomic) MBProgressHUD * hudActivityIndicator;
- (void) showHUDActivityIndicator:(NSString *)message;
- (void) hideHUDActivityIndicator;


@end
