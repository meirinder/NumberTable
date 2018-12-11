//
//  NTArchiverAndUnarchiver.m
//  NumberTable
//
//  Created by Savely on 11.12.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTArchiverAndUnarchiver.h"

@implementation NTArchiverAndUnarchiver





-(void)archiveData:(NSMutableArray<NTNumber*>*)numberList forKey:(NSString*) key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSError *error = [[NSError alloc]init ];
    
    NSData* numberStoreDataForArchive = [NSKeyedArchiver archivedDataWithRootObject:numberList requiringSecureCoding:NO error:&error];
    [defaults setObject:numberStoreDataForArchive forKey:key];
    [defaults synchronize];
    
    [error release];
    [numberStoreDataForArchive release];
}

-(NSMutableArray<NTNumber*>*)unarchiveData:(NSString*) key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSError *error = [[NSError alloc]init ];
    NSData *numberStoreDataForUnarchive = [[NSData alloc]initWithData: [defaults objectForKey:key]];

    NSMutableArray<NTNumber*>* numberList;
    NSSet *set = [NSSet setWithArray:@[[NSMutableArray class],[NTNumber class]]];
    numberList = [NSKeyedUnarchiver unarchivedObjectOfClasses: set fromData:numberStoreDataForUnarchive error:&error];
    [error release];
    [numberStoreDataForUnarchive release];
    return numberList;
}


@end
