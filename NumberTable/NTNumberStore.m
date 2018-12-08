//
//  NTNumberStore.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTNumberStore.h"

@implementation NTNumberStore

int const minCountOfNumbers = 3;
int const placeholderSize = 5;




-(void)fillNumberStore{
    self.numberList = [[NSMutableArray alloc]init];
    for (int i = 0; i < arc4random_uniform(placeholderSize)+minCountOfNumbers; i++) {
        NTNumber *newNumber = [[NTNumber alloc]init];
        [_numberList addObject: newNumber];
        [newNumber release];
    }
}




- (void)dealloc
{
    [_numberList release];
    [super dealloc];
}

@end
