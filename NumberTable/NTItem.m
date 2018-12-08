//
//  Item.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTItem.h"

@implementation NTItem


NTNumberConverter* numberConverter;


//@synthesize number,numberConvertedTOString,isFavourite;




-(instancetype)initWithFloat:(float)outNumber{
    self = [super init];
    if (self) {
        numberConverter = [[NTNumberConverter alloc]init];
        self.number = [self toString: outNumber];
        [_number retain];
        self.numberConvertedTOString = [numberConverter convertFloatToWords:outNumber];
        [_numberConvertedTOString retain];
        [numberConverter release];
    }
    return self;
}

-(NSString*)toString: (float) number{
    return [NSString stringWithFormat: @"%f",number];
}

- (void)dealloc
{
    [_numberConvertedTOString release];
    [_number release];
    [super dealloc];
}

@end
