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

@end
