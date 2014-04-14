//
//  PooWeatherInfoTableViewCell.m
//  YahooAPI
//
//  Created by crazypoo on 14-4-10.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooWeatherInfoTableViewCell.h"

@implementation PooWeatherInfoTableViewCell
@synthesize cityLabel,tempLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 60)];
        [self.contentView addSubview:cityLabel];
        
        tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 100, 60)];
        [self.contentView addSubview:tempLabel];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
