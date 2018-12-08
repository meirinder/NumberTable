//
//  ListDetailViewModel.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTNumberStore.h"


NS_ASSUME_NONNULL_BEGIN

@interface NTListDetailViewModel : NSObject

@property (nonatomic, retain) id userInfo;
@property (nonatomic) float number;
@property (nonatomic) BOOL isFavourite;

-(void) setFavourite: (BOOL) value;
@end

NS_ASSUME_NONNULL_END
