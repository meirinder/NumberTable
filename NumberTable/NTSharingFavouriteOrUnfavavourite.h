//
//  SharingFavouriteOrUnfavavourite.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTSharingFavouriteOrUnfavavourite <NSObject>

-(void) setFavourite: (NSInteger) cell;
-(void) setUnfavourite: (NSInteger) cell;

@end

NS_ASSUME_NONNULL_END
