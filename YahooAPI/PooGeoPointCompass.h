//
//  PooGeoPointCompass.h
//  YahooAPI
//
//  Created by crazypoo on 14-4-14.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PooGeoPointCompass : NSObject <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager* locationManager;
@property (nonatomic, retain) UIImageView *arrowImageView;
@property (nonatomic) CLLocationDegrees latitudeOfTargetedPoint;
@property (nonatomic) CLLocationDegrees longitudeOfTargetedPoint;
@end
