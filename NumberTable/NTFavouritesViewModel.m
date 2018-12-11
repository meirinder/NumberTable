//
//  FavouritesViewModel.m
//  NumberTable
//
//  Created by Savely on 28.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTFavouritesViewModel.h"

@interface NTFavouritesViewModel ()
@property (nonatomic,retain) NTItem *favouriteItem;
@property (nonatomic, retain) NSMutableArray<NTItem*>* itemList;
@property (nonatomic, retain) NTNumberStore *numberList;
@property (nonatomic,readonly) NSMutableArray<NSNumber*>* indexes;
@property (nonatomic, retain) NTUserDafaultsWorker *userDefaultsWorker;

@end

@implementation NTFavouritesViewModel

-(void) processingFavouriteButton:(NSInteger) index{
    if(self.numberList.numberList[[self.indexes[index] integerValue]].isFavourite){
        [self setUnfavourite:[self.indexes[index] integerValue]];
    }else{
        [self setFavourite:[self.indexes[index] integerValue]];
    }
}

-(void) deleteNumer:(NSInteger)index{
    [self.numberList.numberList removeObjectAtIndex:[self.indexes[index] integerValue]];
    [self fillItemStore];
    [self.userDefaultsWorker archiveData: self.numberList.numberList forKey:@"numberStore"];
}

-(BOOL) polarityOfCell:(NSInteger) index{
    return self.numberList.numberList[[self.indexes[index] integerValue]].isFavourite;
}

-(NSString*) textForStringNumberLabel:(NSInteger) index{
    return [self.itemList[index].numberConvertedTOString copy];
}

-(UIColor*) textColorForNumberLabel:(NSInteger) index{
    return [self.numberList.numberList[[self.indexes[index] integerValue]].color copy];
}

-(NSString*) textForNumberLabel:(NSInteger) index{
    return [self.itemList[index].number copy];
}

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    self = [super init];
    self.userDefaultsWorker = [[NTUserDafaultsWorker alloc] init];
    if (self) {
        self.numberList = numberStore;
    }
    return self;
}

-(NSArray<NSNumber*>*) getIndexes{
    return [self.indexes copy];
}

-(NTNumberStore*) numberStore{
    return self.numberList;
}

-(NSMutableArray<NTItem*>*) itemStore{
    return [self.itemList copy];
}

-(void)fillItemStore{
    _indexes = [[NSMutableArray alloc]init];
    self.itemList = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.numberList.numberList.count; i++) {
        if (self.numberList.numberList[i].isFavourite){
            self.favouriteItem = [[NTItem alloc] initWithFloat: self.numberList.numberList[i].value];
            [self.itemList addObject:self.favouriteItem];
            [self.indexes addObject:@(i)];
        }
    }
}


- (void)dealloc
{
    [_indexes release];
    [_userDefaultsWorker release];
    [_favouriteItem release];
    [_itemList release];
    [super dealloc];
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
    return NO;
}

- (BOOL)canUnfavouriteNumberWithoutButton { 
    return YES;
}

- (BOOL)canChangeNumber { 
    return NO;
}

- (BOOL)canAddNumber { 
    return NO;
}

@end
