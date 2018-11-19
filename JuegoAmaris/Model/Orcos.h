//
//  Orcos.h
//  JuegoAmaris
//
//  Created by test on 20/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Orcos : NSObject

@property (nonatomic, strong) NSString * idOrco;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * thumbnail;

@property (nonatomic, strong) NSString * age;
@property (nonatomic, strong) NSString * weight;
@property (nonatomic, strong) NSString * height;

@property (nonatomic, strong) NSString * hair_color;
@property (nonatomic, strong) NSArray * professions;
@property (nonatomic, strong) NSArray * friends;

+(void)setOrcos:(Orcos*)orco;
+(Orcos*)getOrcos;
@end
