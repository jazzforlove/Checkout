//
//  Tools.m
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(UIColor *)changeColor:(NSString *)str{
    unsigned int red,green,blue;
    NSString * str1 = [str substringWithRange:NSMakeRange(1, 2)];
    NSString * str2 = [str substringWithRange:NSMakeRange(3, 2)];
    NSString * str3 = [str substringWithRange:NSMakeRange(5, 2)];
    
    NSScanner * canner = [NSScanner scannerWithString:str1];
    [canner scanHexInt:&red];
    
    canner = [NSScanner scannerWithString:str2];
    [canner scanHexInt:&green];
    
    canner = [NSScanner scannerWithString:str3];
    [canner scanHexInt:&blue];
    UIColor * color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    return color;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <=0 || size.height <=0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
