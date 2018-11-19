//
//  CellPopulation.m
//  JuegoAmaris
//
//  Created by test on 19/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "CellPopulation.h"
@interface CellPopulation()
-(void) setOrcos:(NSArray*) orco;
@end

@implementation CellPopulation
CellPopulation * cell2;
- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"si entre en el metodo %@",_orco);
    [self setOrco:_orco];
}

-(void) setOrcos:(NSArray*) orco
{
    NSLog(@"si entre en el metodo1212");
    // NSArray *_orco = orco;
}
@end




