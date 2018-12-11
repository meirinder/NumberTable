//
//  StatsViewModel.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTNumberStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTStatsViewModel : NSObject

@property (nonatomic, retain) NSString* average;
@property (nonatomic, retain) NSString* minimum;
@property (nonatomic, retain) NSString* maximum;

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
-(NTNumberStore*) getNumberStore;
-(void)analyze;
-(NSMutableArray*)prepareChartInformation:(int)partsCount;

@end

NS_ASSUME_NONNULL_END
