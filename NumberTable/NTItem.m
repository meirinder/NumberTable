//
//  Item.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTItem.h"
@interface NTItem ()

@property (nonatomic, retain) NTNumberConverter* numberConverter;

@end

@implementation NTItem


-(instancetype)initWithFloat:(float)outNumber{
    self = [super init];
    if (self) {
        self.numberConverter = [[NTNumberConverter alloc]init];
        self.number = [self toString: outNumber];
        [_number retain];
        self.numberConvertedTOString = [self.numberConverter convertFloatToWords:outNumber];
        [_numberConvertedTOString retain];
    }
    return self;
}

-(NSString*)toString: (float) number{
    return [NSString stringWithFormat: @"%f",number];
}

- (void)dealloc{
    [_numberConverter release];
    [_numberConvertedTOString release];
    [_number release];
    [super dealloc];
}

@end
