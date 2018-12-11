//
//  NumberConverter.h
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTNumberConverter : NSObject

-(NSString*) convertFloatToWords: (float) number;

@end

NS_ASSUME_NONNULL_END
