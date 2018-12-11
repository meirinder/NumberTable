//
//  NTNumber.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTNumber.h"



@implementation NTNumber

float const MAX_FLOAT = 99.99f;
float const MIN_FLOAT = -99.99f;



+ (BOOL)supportsSecureCoding
{
    return YES;
}


-(id)init{
    self = [super init];
    if (self){
        [self setValue: [self randomFloatBetween: MIN_FLOAT and: MAX_FLOAT]];
        self.color = [UIColor colorWithHue:[self randomFloatBetween:0 and:1] saturation:1 brightness:1 alpha:1];
        [_color retain];
        [self setIsFavourite: NO];
    }
    return self;
}


-(void)dealloc{
    [_color release];
    [super dealloc];
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeFloat:_value forKey:@"value"];
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeBool:_isFavourite forKey:@"isFavourite"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]){
        self.value = [aDecoder decodeFloatForKey:@"value"];
        self.color = [aDecoder decodeObjectOfClass:UIColor.class forKey:@"color"];
//        self.color = [aDecoder decodeObjectForKey:@"color"];
        self.isFavourite = [aDecoder decodeBoolForKey:@"isFavourite"];
    }
    return self;
}

@end
