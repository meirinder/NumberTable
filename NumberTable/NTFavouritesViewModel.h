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

-(NSArray<NSNumber*>*) getIndexes;
-(NTNumberStore*) numberStore;
-(NSArray<NTItem*>*) itemStore;
-(void)fillItemStore;
-(NSString*) textForNumberLabel:(NSInteger) index;
- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
-(UIColor*) textColorForNumberLabel:(NSInteger) index;
-(NSString*) textForStringNumberLabel:(NSInteger) index;
-(BOOL) polarityOfCell:(NSInteger) index;
-(void) processingFavouriteButton:(NSInteger) index;
-(void) deleteNumer:(NSInteger)index;
-(BOOL) canDeleteNumber;
-(BOOL) canUnfavouriteNumberWithoutButton;
-(BOOL) canChangeNumber;
-(BOOL) canAddNumber;

@end

NS_ASSUME_NONNULL_END
