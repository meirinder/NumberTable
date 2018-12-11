//
//  StatsViewModel.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTStatsViewModel.h"

@interface NTStatsViewModel()
@property (nonatomic, retain) NTNumberStore *numberStore;

@end

@implementation NTStatsViewModel

-(NTNumberStore*) getNumberStore{
    return self.numberStore;
}

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    self = [super init];
    if (self) {
        self.numberStore = numberStore;
    }
    return self;
}

-(void)analyze{
    float maximum = -100;
    float minimum = 100;

    float sum = 0;
    for (NTNumber *number in self.numberStore.numberList) {
        sum += number.value;
        if (number.value > maximum){
            maximum = number.value;
        }
        if (number.value < minimum){
            minimum = number.value;
        }
    }
    self.maximum = [NSString stringWithFormat:@"%f",maximum];
    self.minimum = [NSString stringWithFormat:@"%f",minimum];
    self.average = [NSString stringWithFormat:@"%f",sum / self.numberStore.numberList.count];
}

-(NSMutableArray*)prepareChartInformation:(int)partsCount{
    NSMutableArray* res = [[NSMutableArray alloc]init];
    [res autorelease];
    for (int i = 0; i < partsCount; i++) {
        [res addObject:[NSNumber numberWithInteger: 0]];
    }
    float part = 200 / partsCount;
    float botBound;
    float topBound;
    for (int j = 0; j < self.numberStore.numberList.count; j++) {
        for (int i = 0; i < partsCount; i++) {
            topBound = -100+part*(i+1);
            botBound = -100+part*i;
            if ((self.numberStore.numberList[j].value >= botBound)&&(self.numberStore.numberList[j].value < topBound)) {
                int tmp = [[res objectAtIndex:i] intValue];
                tmp++;
                [res setObject:[NSNumber numberWithInteger:tmp] atIndexedSubscript:i];
            }
        }
    }
    return res;
}

@end
