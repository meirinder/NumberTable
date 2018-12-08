//
//  FavouritesViewModel.h
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTListFatherViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTFavouritesViewModel : NTListFatherViewModel <NTSharingFavouriteOrUnfavavourite>

-(NSMutableArray<NSNumber*>*) getIndexes;
-(NTNumberStore*) getNumberStore;
-(NSMutableArray<NTItem*>*) getItemStore;
-(void)fillItemStore;

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
@end

NS_ASSUME_NONNULL_END
