//
//  Service.m
//  JuegoAmaris
//
//  Created by test on 19/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "Service.h"

@implementation Service

NSData *response1;
NSArray * lista;
NSArray * rate;
NSDictionary *publicTimeline;

+(void)explorer:(void (^)(id))success failureBlock:(void (^)(NSError *))failure
{
    NSURL *URL = [NSURL URLWithString:@"https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
     {
         NSError *jsonParsingError = nil;
         publicTimeline = [NSJSONSerialization JSONObjectWithData:data                                                              options:0 error:&jsonParsingError];
         success([self validarArray:publicTimeline]);
     }];
    
    [dataTask resume] ;
}

+(NSArray *)validarArray:(id)array
{
    if (array != nil)
    {
        if(![array isKindOfClass:[NSArray class]])
        {
            array= [NSArray arrayWithObject:array];
        }
    }
    return  array;
}
@end
