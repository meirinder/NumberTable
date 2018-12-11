//
//  ListViewModel.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListViewModel.h"

@interface NTListViewModel ()

@property (nonatomic,retain) NTItem *item;
@property (nonatomic, retain) NSMutableArray<NTItem*>* itemStore;
@property (nonatomic, retain) NTNumberStore *numberStore;
@property (nonatomic, retain) NTUserDafaultsWorker *userDefaultsWorker;

@end

@implementation NTListViewModel


-(void) processingFavouriteButton:(NSInteger) index{
    if(_numberStore.numberList[index].isFavourite){
        [self setUnfavourite:index];
    }else{
        [self setFavourite:index];
    }
}



-(BOOL) getPolarityOfCell:(NSInteger) index{
    return _numberStore.numberList[index].isFavourite;
}

-(float) getValuePrepareInformation:(NSInteger) index{
    return _numberStore.numberList[index].value;
}

-(BOOL) getFavouritePrepareInformation:(NSInteger) index{
    return _numberStore.numberList[index].isFavourite;
}

-(NSString*) getTextForStringNumberLabel:(NSInteger) index{
    return _itemStore[index].numberConvertedTOString;
}

-(NSString*) getTextForNumberLabel:(NSInteger) index{
    return _itemStore[index].number;
}

-(UIColor*) getTextColorForNumberLabel:(NSInteger) index{
    return _numberStore.numberList[index].color;
}

-(NTNumberStore*) getNumberStore{
    return self.numberStore;
}

-(NSMutableArray<NTItem*>*) getItemStore{
    return self.itemStore;
}

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    self = [super init];
    _userDefaultsWorker = [[NTUserDafaultsWorker alloc] init];
    if (self) {
        self.numberStore = numberStore;
    }
    return self;
}

-(void)fillItemStore{
    self.itemStore = [[NSMutableArray alloc]init];
    for (NTNumber* ntNumber in _numberStore.numberList) {
        self.item = [[NTItem alloc] initWithFloat: ntNumber.value];
        
        [_itemStore addObject:_item];
    }
}


- (void)dealloc
{
    [_userDefaultsWorker release];
    [_item release];
    [_itemStore release];
    [super dealloc];
}

-(void) setNumerStoreValue:(NSInteger) index value: (float) value{
    self.numberStore.numberList[index].value = value;
    [_userDefaultsWorker archiveData: self.numberStore.numberList forKey:@"numberStore"];
}

-(void)addItem{
    NTNumber *object = [[NTNumber alloc]init];
    [self.numberStore.numberList addObject: object];
    [object autorelease];
    [_userDefaultsWorker archiveData: self.numberStore.numberList forKey:@"numberStore"];
}

-(void) deleteNumer:(NSInteger)index{
    [_numberStore.numberList removeObjectAtIndex:index];
    [self fillItemStore];
    [_userDefaultsWorker archiveData: self.numberStore.numberList forKey:@"numberStore"];
}

-(void)setFavourite:(NSInteger) cell{
    self.numberStore.numberList[cell].isFavourite = YES;
    [_userDefaultsWorker archiveData: self.numberStore.numberList forKey:@"numberStore"];
}

-(void)setUnfavourite:(NSInteger) cell{
    self.numberStore.numberList[cell].isFavourite = NO;
    [_userDefaultsWorker archiveData: self.numberStore.numberList forKey:@"numberStore"];
}
- (BOOL)canDeleteNumber { 
    return YES;
}

- (BOOL)canUnfavouriteNumberWithoutButton { 
    return NO;
}

- (BOOL)canChangeNumber { 
    return YES;
}

- (BOOL)canAddNumber { 
    return YES;
}

@end
