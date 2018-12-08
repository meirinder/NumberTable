//
//  ListViewController.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListViewController.h"

@interface NTListViewController ()

@end

@implementation NTListViewController




@dynamic listTableView;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_listViewModel fillItemStore];
    [[super listTableView] reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == [_listViewModel getItemStore].count) {
        NTAddItemToListTableViewCell *addCell = [[super listTableView] dequeueReusableCellWithIdentifier:@"AddCell"];
        return addCell;
    }
    NTListTableViewCell *cell = [[super listTableView] dequeueReusableCellWithIdentifier:@"ListCell"];
    [cell.favouriteButton setHidden:NO];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.numberLabel.text = [_listViewModel getItemStore][indexPath.row].number;
    cell.numberLabel.textColor = [_listViewModel getNumberStore].numberList[indexPath.row].color;
    cell.stringNumberLabel.text = [_listViewModel getItemStore][indexPath.row].numberConvertedTOString;
    if ([_listViewModel getNumberStore].numberList[indexPath.row].isFavourite){
        [cell.favouriteButton setImage: super.favouriteImage forState: UIControlStateNormal];
    }else {
        [cell.favouriteButton setImage: super.unFavouriteImage forState: UIControlStateNormal];
    }
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_listViewModel getItemStore] count]+1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != [_listViewModel getItemStore].count) {
        [self performSegueWithIdentifier:@"ShowDetailSegue" sender: self];
    }else{
        [_listViewModel addItem];
        [_listViewModel fillItemStore];
        [[super listTableView] reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier  isEqual: @"ShowDetailSegue"]){
        NTListDetailViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [[super listTableView] indexPathForSelectedRow];
        if (indexPath) {
            NTListDetailViewModel* listDetailViewModel = [[NTListDetailViewModel alloc]init];
            [listDetailViewModel setNumber:[_listViewModel getNumberStore].numberList[indexPath.row].value];
            [listDetailViewModel setFavourite:[_listViewModel getNumberStore].numberList[indexPath.row].isFavourite];
            [listDetailViewModel setUserInfo: [NSString stringWithFormat:@"%ld",(long)indexPath.row]];
            vc.delegate = self;
            vc.listDetailViewModel = listDetailViewModel;
            [listDetailViewModel release];
        }
    }
}


-(void)onClick: (UIButton*)button{
    CGPoint buttonPosition = [button convertPoint:CGPointZero toView:[super listTableView]];
    NSIndexPath *indexPath = [[super listTableView] indexPathForRowAtPoint:buttonPosition];
    if([_listViewModel getNumberStore].numberList[indexPath.row].isFavourite){
        [_listViewModel setUnfavourite:indexPath.row];
    }else{
        [_listViewModel setFavourite:indexPath.row];
    }
    [[super listTableView] reloadData];
    NSLog(@"%ld",(long)indexPath.row);
}

-(void)onClicBarButton: (BOOL) isFavourite userInfo: (NSInteger) index{
    if (isFavourite) {
        [self.listViewModel getNumberStore].numberList[index].isFavourite = NO;
    }else{
        [self.listViewModel getNumberStore].numberList[index].isFavourite = YES;
    }
}
-(void)save:(float) number userInfo: (NSInteger) index{
    [self.listViewModel getNumberStore].numberList[index].value = number;
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == [[_listViewModel getItemStore] count]) {
        return  NO;
    }
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[self.listViewModel getNumberStore].numberList removeObjectAtIndex:indexPath.row];
        [_listViewModel fillItemStore];
        [[super listTableView] deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
