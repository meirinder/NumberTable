//
//  ListViewController.m
//  NumberTable
//
//  Created by Savely on 29.11.2018.
//  Copyright © 2018 Kulizhnikov. All rights reserved.
//

#import "NTListViewController.h"

@interface NTListViewController ()
@property (retain, nonatomic) IBOutlet UITableView *listTableView;

@property (nonatomic,retain) UIImage *favouriteImage;
@property (nonatomic,retain) UIImage *unFavouriteImage;

@end

@implementation NTListViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.listViewModel fillItemStore];
    [self.listTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.favouriteImage = [UIImage imageNamed:@"favourite.png"];
    self.unFavouriteImage = [UIImage imageNamed:@"unfavourite.png"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((indexPath.row == [self.listViewModel itemStore].count)&&([self.listViewModel canAddNumber])) {
        NTAddItemToListTableViewCell *addCell = [self.listTableView dequeueReusableCellWithIdentifier:@"AddCell"];
        return addCell;
    }
    NTListTableViewCell *cell = [self.listTableView dequeueReusableCellWithIdentifier:@"ListCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.numberLabel.text = [self.listViewModel textForNumberLabel:indexPath.row];
    cell.numberLabel.textColor = [self.listViewModel textColorForNumberLabel:indexPath.row];
    cell.stringNumberLabel.text = [self.listViewModel textForStringNumberLabel:indexPath.row];
    
    if ([self.listViewModel polarityOfCell:indexPath.row]){
        [cell.favouriteButton setImage: self.favouriteImage forState: UIControlStateNormal];
    }else {
        [cell.favouriteButton setImage: self.unFavouriteImage forState: UIControlStateNormal];
    }
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([self.listViewModel canAddNumber]){
         return [[self.listViewModel itemStore] count]+1;
    }
       return [[self.listViewModel itemStore] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.listViewModel canChangeNumber]){
        if (indexPath.row != [self.listViewModel itemStore].count) {
            [self performSegueWithIdentifier:@"ShowDetailSegue" sender: self];
        }else{
            [self.listViewModel addItem];
            [self.listViewModel fillItemStore];
            [self.listTableView reloadData];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier  isEqual: @"ShowDetailSegue"]){
        NTListDetailViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.listTableView indexPathForSelectedRow];
        if (indexPath) {
            NTListDetailViewModel* listDetailViewModel = [[NTListDetailViewModel alloc]init];
            
            [listDetailViewModel setNumber:[self.listViewModel valuePrepareInformation:indexPath.row]];
            [listDetailViewModel setFavourite:[self.listViewModel favouritePrepareInformation:indexPath.row]];
            [listDetailViewModel setUserInfo: [NSString stringWithFormat:@"%ld",(long)indexPath.row]];
            vc.delegate = self;
            vc.listDetailViewModel = listDetailViewModel;
            [listDetailViewModel release];
        }
    }
}


-(void)onClick: (UIButton*)button{
    CGPoint buttonPosition = [button convertPoint:CGPointZero toView:self.listTableView];
    NSIndexPath *indexPath = [self.listTableView indexPathForRowAtPoint:buttonPosition];
    [self.listViewModel processingFavouriteButton:indexPath.row];
    [self.listViewModel fillItemStore];
    [self.listTableView reloadData];
}

-(void)onClicBarButton: (BOOL) isFavourite userInfo: (NSInteger) index{
    [self.listViewModel processingFavouriteButton:index];
}

-(void)save:(float) number userInfo: (NSInteger) index{
    [self.listViewModel setNumerStoreValue:index value:number];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == [[self.listViewModel itemStore] count]) {
        return  NO;
    }
    return YES;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewRowAction *unfavouriteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Unfavourite" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self.listViewModel processingFavouriteButton:indexPath.row];
        [self.listViewModel fillItemStore];
        [self.listTableView reloadData];
    }];
    unfavouriteAction.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self.listViewModel deleteNumer:indexPath.row];
        [self.listTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];    }];
    deleteAction.backgroundColor = [UIColor redColor];
    if(([self.listViewModel canDeleteNumber])&&([self.listViewModel canUnfavouriteNumberWithoutButton])){
        return @[deleteAction,unfavouriteAction];
    }else if ([self.listViewModel canDeleteNumber]) {
        return @[deleteAction];
    }else if([self.listViewModel canUnfavouriteNumberWithoutButton]){
        return @[unfavouriteAction];
    }
    return @[];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)dealloc {
    [_listTableView release];
    [super dealloc];
}

@end
