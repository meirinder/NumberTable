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
-(NSString*) getTextForNumberLabel:(NSInteger) index;
- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
-(UIColor*) getTextColorForNumberLabel:(NSInteger) index;
-(NSString*) getTextForStringNumberLabel:(NSInteger) index;
-(BOOL) getPolarityOfCell:(NSInteger) index;
-(void) processingFavouriteButton:(NSInteger) index;
-(void) deleteNumer:(NSInteger)index;
-(BOOL) canDeleteNumber;
-(BOOL) canUnfavouriteNumberWithoutButton;
-(BOOL) canChangeNumber;
-(BOOL) canAddNumber;
@end

NS_ASSUME_NONNULL_END
