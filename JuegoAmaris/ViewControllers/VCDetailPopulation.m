//
//  VCDetailPopulation.m
//  JuegoAmaris
//
//  Created by test on 20/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "VCDetailPopulation.h"
#import "Orcos.h"
#import "ToolsImage.h"
#import "Service.h"

@interface VCDetailPopulation ()
@end

@implementation VCDetailPopulation
NSArray* sectionNumber;
NSMutableArray*   dataArray ;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lblName.text = [[Orcos getOrcos] valueForKey:@"name"];
    _lblAge.text = [NSString stringWithFormat:@"%@",[[Orcos getOrcos] valueForKey:@"age"]];
    _lblHeight.text =[NSString stringWithFormat:@"%@",[[Orcos getOrcos] valueForKey:@"height"]];
    _lblWeight.text= [NSString stringWithFormat:@"%@",[[Orcos getOrcos] valueForKey:@"weight"]];
    
    sectionNumber = @[@"Professions", @"Friends"];

    NSString * imagerouge_= [[Orcos getOrcos] valueForKey:@"thumbnail"];
  
    if (![imagerouge_ isKindOfClass:[NSNull class]])
    {
        _imgPopulation.image = [ToolsImage convertStringImage:imagerouge_];
    }
    
    
    //Initialize the dataArray
   dataArray = [[NSMutableArray alloc] init];
    
    //First section data
    NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:[[Orcos getOrcos] valueForKey:@"professions"] forKey:@"data"];
    NSArray *arrayfirst = [firstItemsArrayDict objectForKey:@"data"];
    
    if([arrayfirst count]>0)
    [dataArray addObject:firstItemsArrayDict];
    
    //Second section data
    NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:[[Orcos getOrcos] valueForKey:@"friends"] forKey:@"data"];
    
   

    [[secondItemsArrayDict objectForKey:@"data"] count]>0?[dataArray addObject:secondItemsArrayDict]: 0;
    
    
    [_tbProfessions setDelegate:self];
    [_tbProfessions setDataSource:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [dataArray objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"data"];
    return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionNumber objectAtIndex:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}
@end
