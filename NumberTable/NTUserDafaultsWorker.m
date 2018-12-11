//
//  NTArchiverAndUnarchiver.m
//  NumberTable
//
//  Created by Savely on 11.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTUserDafaultsWorker.h"

@implementation NTUserDafaultsWorker

-(void)archiveData:(NSMutableArray<NTNumber*>*)numberList forKey:(NSString*) key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData* numberStoreDataForArchive = [NSKeyedArchiver archivedDataWithRootObject:numberList requiringSecureCoding:NO error:nil];
    [defaults setObject:numberStoreDataForArchive forKey:key];
    [defaults synchronize];
}

-(NSMutableArray<NTNumber*>*)unarchiveData:(NSString*) key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *numberStoreDataForUnarchive = [[NSData alloc]initWithData: [defaults objectForKey:key]];
    NSMutableArray<NTNumber*>* numberList;
    NSSet *set = [NSSet setWithArray:@[[NSMutableArray class],[NTNumber class]]];
    numberList = [NSKeyedUnarchiver unarchivedObjectOfClasses: set fromData:numberStoreDataForUnarchive error:nil];
    [numberStoreDataForUnarchive release];
    return numberList;
}

@end
