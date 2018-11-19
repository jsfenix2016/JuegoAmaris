//
//  Service.h
//  JuegoAmaris
//
//  Created by test on 19/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Service : NSObject

+(NSArray *)validarArray:(id)array;

+ (void)explorer: (void (^)(id))success failureBlock:(void (^)(NSError *))failure;
@end
