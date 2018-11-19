//
//  ToolsImage.m
//  JuegoAmaris
//
//  Created by test on 20/12/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ToolsImage.h"

@implementation ToolsImage

+(UIImage *)convertStringImage:(NSString *)string
{
    
    NSURL *url = [[NSURL alloc]initWithString:string];
    NSData *data =[NSData dataWithContentsOfURL:url];
    
   UIImage * image= [UIImage imageWithData:data];
  
    return image;
   
}
@end
