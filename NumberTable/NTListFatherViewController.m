//
//  ListFatherViewController.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListFatherViewController.h"


@interface NTListFatherViewController ()
-(void)onClick: (UIButton*)button;
@end

@implementation NTListFatherViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.favouriteImage = [UIImage imageNamed:@"favourite.png"];
    self.unFavouriteImage = [UIImage imageNamed:@"unfavourite.png"];
}


-(void)onClick: (UIButton*)button{
}

- (void)dealloc {
    [_listTableView release];
    [super dealloc];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSAssert(NO, @"This method is considered abstract");
    NTListTableViewCell *cell = [_listTableView dequeueReusableCellWithIdentifier:@"ListCell"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSAssert(NO, @"This method is considered abstract");
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}



@end
