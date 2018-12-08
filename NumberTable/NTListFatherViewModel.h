//
//  NTListFatherViewModel.h
//  NumberTable
//
//  Created by Savely on 08.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTSharingFavouriteOrUnfavavourite.h"
#import "NTNumberConverter.h"
#import "NTItem.h"
#import "NTNumberStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTListFatherViewModel : NSObject


-(void) addItem;
-(void) fillItemStore;

-(void)setFavourite:(NSInteger) cell;
-(void)setUnfavourite:(NSInteger) cell;

-(NSMutableArray<NTItem*>*) getItemStore;
-(NTNumberStore*) getNumberStore;

-(instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
-(NSMutableArray<NSNumber*>*) getIndexes;

@end

NS_ASSUME_NONNULL_END