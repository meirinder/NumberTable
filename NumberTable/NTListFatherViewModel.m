//
//  NTListFatherViewModel.m
//  NumberTable
//
//  Created by Savely on 08.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListFatherViewModel.h"

@interface NTListFatherViewModel ()

@property (nonatomic,retain) NTItem *favouriteItem;
@property (nonatomic, retain) NSMutableArray<NTItem*>* itemStore;
@property (nonatomic, retain) NTNumberStore *numberStore;

@property (nonatomic,readonly) NSMutableArray<NSNumber*>* indexes;

@end

@implementation NTListFatherViewModel

-(void) addItem{}
-(void) fillItemStore{}

-(void)setFavourite:(NSInteger) cell{}
-(void)setUnfavourite:(NSInteger) cell{}
-(void) processingFavouriteButton:(NSInteger) index{}
-(void) setNumerStoreValue:(NSInteger) index value: (float) value{}
-(void) deleteNumer:(NSInteger)index{}
-(float) getValuePrepareInformation:(NSInteger) index{
    return 0;
}

-(BOOL) getFavouritePrepareInformation:(NSInteger) index{
    return NO;
}

-(BOOL) getPolarityOfCell:(NSInteger) index{
    return NO;
}

-(NSString*) getTextForStringNumberLabel:(NSInteger) index{
    return @"";
}

-(NSString*) getTextForNumberLabel:(NSInteger) index{
    return _itemStore[index].number;
}

-(UIColor*) getTextColorForNumberLabel:(NSInteger) index{
    UIColor *res = [[UIColor alloc]initWithWhite:1 alpha:1 ];
    [res autorelease];
    return res;
}
-(NSMutableArray<NTItem*>*) getItemStore{
    return self.itemStore;
}
-(NTNumberStore*) getNumberStore{
    return self.numberStore;
}

-(instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    return self;
}
-(NSMutableArray<NSNumber*>*) getIndexes{
    return self.indexes;
    
}

- (BOOL)canDeleteNumber { 
    return NO;
}

- (BOOL)canUnfavouriteNumberWithoutButton { 
    return NO;
}

- (BOOL)canChangeNumber { 
    return NO;
}

- (BOOL)canAddNumber { 
    return NO;
}

@end
