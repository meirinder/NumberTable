//
//  NTNumber.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




NS_ASSUME_NONNULL_BEGIN

@interface NTNumber : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic) float value;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic) BOOL isFavourite;




@end

NS_ASSUME_NONNULL_END
