//
//  VCListPopulation.h
//  JuegoAmaris
//
//  Created by test on 19/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCListPopulation : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionPopulation;

@property (strong, nonatomic) IBOutletCollection(UISearchBar) NSArray *searchText1;


@end
