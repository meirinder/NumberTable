//
//  StatsViewController.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTStatsViewModel.h"
#import "NTChartView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTStatsViewController : UIViewController
@property (nonatomic, retain) NTStatsViewModel* statsViewModel;


@end

NS_ASSUME_NONNULL_END
