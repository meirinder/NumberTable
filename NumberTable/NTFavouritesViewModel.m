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
@property (nonatomic, retain) NSMutableArray<NTItem*>* itemStore;
@property (nonatomic, retain) NTNumberStore *numberStore;
@property (nonatomic,readonly) NSMutableArray<NSNumber*>* indexes;
@property (nonatomic, retain) NTArchiverAndUnarchiver *archiverAndUnarchiver;

@end

@implementation NTFavouritesViewModel

@dynamic isUnfavouriteViewModel;
-(void) processingFavouriteButton:(NSInteger) index{
    if(_numberStore.numberList[[_indexes[index] integerValue]].isFavourite){
        [self setUnfavourite:[_indexes[index] integerValue]];
    }else{
        [self setFavourite:[_indexes[index] integerValue]];
    }
}

-(void) deleteNumer:(NSInteger)index{
    [_numberStore.numberList removeObjectAtIndex:[_indexes[index] integerValue]];
    [self fillItemStore];
    [_archiverAndUnarchiver archiveData: self.numberStore.numberList forKey:@"numberStore"];
}

-(BOOL) getPolarityOfCell:(NSInteger) index{
    return _numberStore.numberList[[_indexes[index] integerValue]].isFavourite;
}

-(NSString*) getTextForStringNumberLabel:(NSInteger) index{
    return _itemStore[index].numberConvertedTOString;
}

-(UIColor*) getTextColorForNumberLabel:(NSInteger) index{
    return _numberStore.numberList[[_indexes[index] integerValue]].color;
}

-(NSString*) getTextForNumberLabel:(NSInteger) index{
    return _itemStore[index].number;
}

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    self = [super init];
    _archiverAndUnarchiver = [[NTArchiverAndUnarchiver alloc] init];
    if (self) {
        self.numberStore = numberStore;
        self.isUnfavouriteViewModel = NO;
    }
    return self;
}

-(NSMutableArray<NSNumber*>*) getIndexes{
    return self.indexes;
}

-(NTNumberStore*) getNumberStore{
    return self.numberStore;
}

-(NSMutableArray<NTItem*>*) getItemStore{
    return self.itemStore;
}

-(void)fillItemStore{
    _indexes = [[NSMutableArray alloc]init];
    self.itemStore = [[NSMutableArray alloc]init];
    for (int i = 0; i < _numberStore.numberList.count; i++) {
        if (_numberStore.numberList[i].isFavourite){
            self.favouriteItem = [[NTItem alloc] initWithFloat: _numberStore.numberList[i].value];
            [_itemStore addObject:_favouriteItem];
            [_indexes addObject:@(i)];
        }
    }
}


- (void)dealloc
{
    [_indexes release];
    [_archiverAndUnarchiver release];
    [_favouriteItem release];
    [_itemStore release];
    [super dealloc];
}

-(void)setFavourite:(NSInteger) cell{
    self.numberStore.numberList[cell].isFavourite = YES;
    [_archiverAndUnarchiver archiveData: self.numberStore.numberList forKey:@"numberStore"];
}

-(void)setUnfavourite:(NSInteger) cell{
    self.numberStore.numberList[cell].isFavourite = NO;
    [_archiverAndUnarchiver archiveData: self.numberStore.numberList forKey:@"numberStore"];
}


@end
