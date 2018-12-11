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
#import "NTUserDafaultsWorker.h"


#import "NTNumberStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTListFatherViewModel : NSObject

-(void) addItem;
-(void) fillItemStore;
-(void)setFavourite:(NSInteger) cell;
-(void)setUnfavourite:(NSInteger) cell;
-(NSArray<NTItem*>*) itemStore;
-(NTNumberStore*) numberStore;
-(instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
-(NSArray<NSNumber*>*) getIndexes;
-(NSString*) textForNumberLabel:(NSInteger) index;
-(UIColor*) textColorForNumberLabel:(NSInteger) index;
-(NSString*) textForStringNumberLabel:(NSInteger) index;
-(BOOL) polarityOfCell:(NSInteger) index;
-(float) valuePrepareInformation:(NSInteger) index;
-(BOOL) favouritePrepareInformation:(NSInteger) index;
-(void) processingFavouriteButton:(NSInteger) index;
-(void) setNumerStoreValue:(NSInteger) index value: (float) value;
-(void) deleteNumer:(NSInteger)index;
-(BOOL) canDeleteNumber;
-(BOOL) canUnfavouriteNumberWithoutButton;
-(BOOL) canChangeNumber;
-(BOOL) canAddNumber;

@end

NS_ASSUME_NONNULL_END
