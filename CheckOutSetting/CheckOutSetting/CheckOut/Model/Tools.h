//
//  Tools.h
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject

+(UIColor *)changeColor:(NSString *)str;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
