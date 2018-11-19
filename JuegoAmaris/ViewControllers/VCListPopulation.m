//
//  VCListPopulation.m
//  JuegoAmaris
//
//  Created by test on 19/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "VCListPopulation.h"
#import "Service.h"
#import "CellPopulation.h"
#import "ToolsImage.h"
#import "Orcos.h"
#import "VCDetailPopulation.h"

@interface VCListPopulation ()
{
    dispatch_function_t *dispatch;
    Orcos * orcos;
}

@property (nonatomic) NSMutableArray<Orcos *> *list;

@end

NSArray * _task;
NSArray * Consulta;
UIImage *ret;
CellPopulation * cell;

@implementation VCListPopulation
{
    NSArray *recipes;
    NSArray *searchResults;
    
    NSMutableArray *tableDataArray;
    BOOL searchEnabled;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(_task == NULL)
    {
        [Service explorer:^(id result)
         {
             _task = [[result objectAtIndex:0]objectForKey:@"Brastlewark"];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.CollectionPopulation reloadData];
             });
         }
             failureBlock:^(NSError * error)
         {
             NSLog(@"%@",error);
         }];
    }
    
    [_CollectionPopulation setDataSource:self];
    [_CollectionPopulation setDelegate:self];
}

- (void)filterContentForSearchText:(NSString*)searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name beginswith %@", searchText];
    searchResults = [_task filteredArrayUsingPredicate:resultPredicate];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.CollectionPopulation reloadData];
    });
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length == 0) {
        searchEnabled = NO;
        [_CollectionPopulation reloadData];
    }
    else {
        searchEnabled = YES;
        [self filterContentForSearchText:searchBar.text];
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchEnabled = YES;
    [self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setText:@""];
    searchEnabled = NO;
    [_CollectionPopulation reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueDetail"])
    {
        NSArray * index = [self.CollectionPopulation indexPathsForSelectedItems];
        
        NSIndexPath * prueba = [index objectAtIndex:0];
       
        orcos = [searchEnabled == true ? searchResults : _task objectAtIndex:[prueba row]];
        [Orcos setOrcos:orcos];
        
        VCDetailPopulation *vcDetailPopulation = [segue destinationViewController];
        vcDetailPopulation.lblName.text = [orcos valueForKey:@"name"];
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell = (CellPopulation *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if(searchEnabled)
    {
         cell = [self newCell:searchResults :indexPath];
    }
    else
    {
         cell = [self newCell:_task :indexPath];
    }
   
    return cell;
}

-( CellPopulation *)newCell:(NSArray *)list :(NSIndexPath *)indexPath
{
    
    cell.lblName.text = [[list objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.orco = [list objectAtIndex:indexPath.row];
    cell.lblAge.text =[NSString stringWithFormat:@"%@",[[list objectAtIndex:indexPath.row]objectForKey:@"age"]];
    
    cell.lblHeight.text = [NSString stringWithFormat:@"%@",[[list objectAtIndex:indexPath.row]objectForKey:@"height"]];
    
    cell.lblWeight.text =[NSString stringWithFormat:@"%@",[[list objectAtIndex:indexPath.row]objectForKey:@"weight"]];
    
    NSString * imagerouge_= [[list objectAtIndex:indexPath.row]objectForKey:@"thumbnail"];
        
    cell.imgPopulation.image=[ToolsImage convertStringImage:imagerouge_];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (searchEnabled ) {
        return [searchResults count];
    } else {
        return [_task count];
    }
}
@end
