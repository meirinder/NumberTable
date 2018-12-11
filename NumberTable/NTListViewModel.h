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
-(NSString*) textForNumberLabel:(NSInteger) index;
-(NSString*) textForStringNumberLabel:(NSInteger) index;
-(UIColor*) textColorForNumberLabel:(NSInteger) index;
-(NSArray<NTItem*>*) itemStore;
-(NTNumberStore*) numberStore;
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
-(instancetype)initWithNumberStore:(NTNumberStore*) numberStore;

@end

NS_ASSUME_NONNULL_END
