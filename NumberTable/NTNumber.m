//
//  NTNumber.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTNumber.h"
@interface NTNumber()

@property (nonatomic)float const MAX_FLOAT;
@property (nonatomic)float const MIN_FLOAT;

@end

@implementation NTNumber

+ (BOOL)supportsSecureCoding
{
    return YES;
}

-(id)init{
    self = [super init];
    if (self){
        self.MAX_FLOAT = 99.99f;
        self.MIN_FLOAT = -99.99f;
        [self setValue: [self randomFloatBetween: self.MIN_FLOAT and: self.MAX_FLOAT]];
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
    [aCoder encodeFloat:self.value forKey:@"value"];
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodeBool:self.isFavourite forKey:@"isFavourite"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]){
        self.value = [aDecoder decodeFloatForKey:@"value"];
        self.color = [aDecoder decodeObjectOfClass:UIColor.class forKey:@"color"];
        self.isFavourite = [aDecoder decodeBoolForKey:@"isFavourite"];
    }
    return self;
}

@end
