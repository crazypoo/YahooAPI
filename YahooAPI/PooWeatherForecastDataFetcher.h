//
//  PooWeatherForecastDataFetcher.h
//  YahooAPI
//
//  Created by crazypoo on 14-4-11.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PooCityModel.h"

@protocol PooWeatherForecastDataFetcherDelegate <NSObject>

- (void) setCityWeatherInfo:(PooCityModel *) cityM;
- (void) errorNotification:(NSString*)errorMsg;

@end

@interface PooWeatherForecastDataFetcher : NSObject<NSURLConnectionDelegate>
{
    NSURLConnection * connection;
    
}
@property (strong, nonatomic) NSMutableData *responseData;
@property (nonatomic, assign) BOOL isDownloading;
@property (nonatomic, unsafe_unretained) id <PooWeatherForecastDataFetcherDelegate> delegate;

- (void)getWeatherHistoryForCity:(NSString *)cityName;
@end
