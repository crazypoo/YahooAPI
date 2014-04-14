//
//  PooCityModel.h
//  YahooAPI
//
//  Created by crazypoo on 14-4-11.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PooCityModel : NSObject
@property (nonatomic, strong) NSString* cityName;
@property (nonatomic, strong) NSDictionary * mainDict;
@property (nonatomic, strong) NSDictionary * itemsDict;
@property (nonatomic, strong) NSString * items_Title;
@property (nonatomic, strong) NSString * items_Lat;
@property (nonatomic, strong) NSString * items_Long;
@property (nonatomic, strong) NSString * items_pubDate;
@property (nonatomic, strong) NSDictionary * items_Condition_Dict;
@property (nonatomic, strong) NSArray * items_Forecast_Array;
@end
