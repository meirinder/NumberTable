//
//  NTListViewMode.h
//  NumberTable
//
//  Created by Savely on 08.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTListFatherViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTListViewModel : NTListFatherViewModel

-(void) addItem;
-(void) fillItemStore;

-(void)setFavourite:(NSInteger) cell;
-(void)setUnfavourite:(NSInteger) cell;
-(NSString*) getTextForNumberLabel:(NSInteger) index;
-(NSString*) getTextForStringNumberLabel:(NSInteger) index;
-(UIColor*) getTextColorForNumberLabel:(NSInteger) index;
-(NSMutableArray<NTItem*>*) getItemStore;
-(NTNumberStore*) getNumberStore;
-(BOOL) getPolarityOfCell:(NSInteger) index;
-(float) getValuePrepareInformation:(NSInteger) index;
-(BOOL) getFavouritePrepareInformation:(NSInteger) index;
-(void) processingFavouriteButton:(NSInteger) index;
-(void) setNumerStoreValue:(NSInteger) index value: (float) value;
-(void) deleteNumer:(NSInteger)index;

-(instancetype)initWithNumberStore:(NTNumberStore*) numberStore;
@end

NS_ASSUME_NONNULL_END
