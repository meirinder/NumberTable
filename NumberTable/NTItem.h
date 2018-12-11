//
//  Item.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTNumberConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTItem : NSObject

@property (nonatomic, retain) NSString* number;
@property (nonatomic, retain) NSString* numberConvertedTOString;

- (NSString *)toString: (float) number;
-(instancetype)initWithFloat:(float)outNumber;

@end

NS_ASSUME_NONNULL_END
