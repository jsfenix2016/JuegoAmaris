//
//  VCDetailPopulation.h
//  JuegoAmaris
//
//  Created by test on 20/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCDetailPopulation : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewBackGroundColor;

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imgPopulation;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;
@property (weak, nonatomic) IBOutlet UITableView *tbProfessions;

@end
