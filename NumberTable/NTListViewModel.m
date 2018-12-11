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
@property (nonatomic, retain) NSMutableArray<NTItem*>* itemList;
@property (nonatomic, retain) NTNumberStore *numberList;
@property (nonatomic, retain) NTUserDafaultsWorker *userDefaultsWorker;

@end

@implementation NTListViewModel

-(void) processingFavouriteButton:(NSInteger) index{
    if(self.numberList.numberList[index].isFavourite){
        [self setUnfavourite:index];
    }else{
        [self setFavourite:index];
    }
}

-(BOOL) polarityOfCell:(NSInteger) index{
    return self.numberList.numberList[index].isFavourite;
}

-(float) valuePrepareInformation:(NSInteger) index{
    return self.numberList.numberList[index].value;
}

-(BOOL) favouritePrepareInformation:(NSInteger) index{
    return self.numberList.numberList[index].isFavourite;
}

-(NSString*) textForStringNumberLabel:(NSInteger) index{
    return [self.itemList[index].numberConvertedTOString copy];
}

-(NSString*) textForNumberLabel:(NSInteger) index{
    return [self.itemList[index].number copy];
}

-(UIColor*) textColorForNumberLabel:(NSInteger) index{
    return [self.numberList.numberList[index].color copy];
}

-(NTNumberStore*) numberStore{
    return self.numberList;
}

-(NSArray<NTItem*>*) itemStore{
    return [self.itemList copy];
}

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    self = [super init];
    self.userDefaultsWorker = [[NTUserDafaultsWorker alloc] init];
    if (self) {
        self.numberList = numberStore;
    }
    return self;
}

-(void)fillItemStore{
    self.itemList = [[NSMutableArray alloc]init];
    for (NTNumber* ntNumber in self.numberList.numberList) {
        self.item = [[NTItem alloc] initWithFloat: ntNumber.value];
        
        [self.itemList addObject:self.item];
    }
}

- (void)dealloc
{
    [_userDefaultsWorker release];
    [_item release];
    [_itemList release];
    [super dealloc];
}

-(void) setNumerStoreValue:(NSInteger) index value: (float) value{
    self.numberList.numberList[index].value = value;
    [self.userDefaultsWorker archiveData: self.numberList.numberList forKey:@"numberStore"];
}

-(void)addItem{
    NTNumber *object = [[NTNumber alloc]init];
    [self.numberList.numberList addObject: object];
    [object autorelease];
    [self.userDefaultsWorker archiveData: self.numberList.numberList forKey:@"numberStore"];
}

-(void) deleteNumer:(NSInteger)index{
    [self.numberList.numberList removeObjectAtIndex:index];
    [self fillItemStore];
    [self.userDefaultsWorker archiveData: self.numberList.numberList forKey:@"numberStore"];
}

-(void)setFavourite:(NSInteger) cell{
    self.numberList.numberList[cell].isFavourite = YES;
    [self.userDefaultsWorker archiveData: self.numberList.numberList forKey:@"numberStore"];
}

-(void)setUnfavourite:(NSInteger) cell{
    self.numberList.numberList[cell].isFavourite = NO;
    [self.userDefaultsWorker archiveData: self.numberList.numberList forKey:@"numberStore"];
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
