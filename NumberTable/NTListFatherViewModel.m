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
@property (nonatomic, retain) NSMutableArray<NTItem*>* itemList;
@property (nonatomic, retain) NTNumberStore *numberList;
@property (nonatomic,readonly) NSMutableArray<NSNumber*>* indexes;

@end

@implementation NTListFatherViewModel

-(void) addItem{}
-(void) fillItemStore{}
-(void) setFavourite:(NSInteger) cell{}
-(void) setUnfavourite:(NSInteger) cell{}
-(void) processingFavouriteButton:(NSInteger) index{}
-(void) setNumerStoreValue:(NSInteger) index value: (float) value{}
-(void) deleteNumer:(NSInteger)index{}

-(float) valuePrepareInformation:(NSInteger) index{
    return 0;
}

-(BOOL) favouritePrepareInformation:(NSInteger) index{
    return NO;
}

-(BOOL) polarityOfCell:(NSInteger) index{
    return NO;
}

-(NSString*) textForStringNumberLabel:(NSInteger) index{
    return @"";
}

-(NSString*) textForNumberLabel:(NSInteger) index{
    return [self.itemList[index].number copy];
}

-(UIColor*) textColorForNumberLabel:(NSInteger) index{
    UIColor *res = [[UIColor alloc]initWithWhite:1 alpha:1 ];
    [res autorelease];
    return [res copy];
}

-(NSArray<NTItem*>*) itemStore{
    return [self.itemList copy];
}

-(NTNumberStore*) numberStore{
    return self.numberList;
}

-(instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    return self;
}
-(NSArray<NSNumber*>*) getIndexes{
    return [self.indexes copy];
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
