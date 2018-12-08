//
//  FavouritesViewController.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTFavouritesViewController.h"

@interface NTFavouritesViewController ()
@end

@implementation NTFavouritesViewController

@dynamic listTableView;



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_favouriteViewModel fillItemStore];
    [[super listTableView] reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NTListTableViewCell *cell = [[super listTableView] dequeueReusableCellWithIdentifier:@"ListCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.numberLabel.text = [_favouriteViewModel getItemStore][indexPath.row].number;
    cell.stringNumberLabel.text = [_favouriteViewModel getItemStore][indexPath.row].numberConvertedTOString;
    NSInteger index = [[_favouriteViewModel getIndexes][indexPath.row] integerValue];
    if ([_favouriteViewModel getNumberStore].numberList[index].isFavourite){
        [cell.favouriteButton setImage: super.favouriteImage forState: UIControlStateNormal];
    }else {
        [cell.favouriteButton setImage: super.unFavouriteImage forState: UIControlStateNormal];
    }
    cell.delegate = self;

    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_favouriteViewModel getItemStore].count;
}

-(void)onClick: (UIButton*)button{
    CGPoint buttonPosition = [button convertPoint:CGPointZero toView:[super listTableView]];
    NSIndexPath *indexPath = [[super listTableView] indexPathForRowAtPoint:buttonPosition];
    NSInteger index = [[_favouriteViewModel getIndexes][indexPath.row] integerValue];
    if([_favouriteViewModel getNumberStore].numberList[index].isFavourite){
        [_favouriteViewModel setUnfavourite:index];
    }else{
        [_favouriteViewModel setFavourite:index];
    }
    [[super listTableView] reloadData];
    NSLog(@"%ld",(long)index);
}


@end
