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

@end

@implementation NTFavouritesViewModel

- (instancetype)initWithNumberStore:(NTNumberStore*) numberStore{
    self = [super init];
    if (self) {
        self.numberStore = numberStore;
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
    [_favouriteItem release];
    [_itemStore release];
    [super dealloc];
}

-(void)setFavourite:(NSInteger) cell{
    self.numberStore.numberList[cell].isFavourite = YES;
}

-(void)setUnfavourite:(NSInteger) cell{
    self.numberStore.numberList[cell].isFavourite = NO;
}


@end
