//
//  NTNumberStore.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTNumberStore.h"
@interface NTNumberStore()

@property (nonatomic)int const minCountOfNumbers;
@property (nonatomic)int const placeholderSize;

@end

@implementation NTNumberStore

-(void)fillNumberStore{
    self.minCountOfNumbers = 3;
    self.placeholderSize = 5;
    self.numberList = [[NSMutableArray alloc]init];
    for (int i = 0; i < arc4random_uniform(self.placeholderSize)+self.minCountOfNumbers; i++) {
        NTNumber *newNumber = [[NTNumber alloc]init];
        [self.numberList addObject: newNumber];
        [newNumber release];
    }
}

- (void)dealloc{
    [_numberList release];
    [super dealloc];
}

@end
