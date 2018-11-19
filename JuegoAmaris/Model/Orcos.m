//
//  Orcos.m
//  JuegoAmaris
//
//  Created by test on 20/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "Orcos.h"

@implementation Orcos
static Orcos *_orcos;

+(Orcos*)getOrcos
{
    return _orcos;
}

+(void)setOrcos:(Orcos*)orcos
{
    _orcos = orcos;
}

@end
