//
//  CellPopulation.h
//  JuegoAmaris
//
//  Created by test on 19/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Orcos.h"
@interface CellPopulation : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgPopulation;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) NSArray* orco;
+(void) setOrcos:(NSArray*) orco ;

@end
