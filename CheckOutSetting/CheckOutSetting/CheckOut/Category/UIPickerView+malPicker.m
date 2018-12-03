//
//  UIPickerView+malPicker.m
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/12/3.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "UIPickerView+malPicker.h"

@implementation UIPickerView (malPicker)

- (void)clearSeparatorLine{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.height < 1) {
            obj.hidden = YES;
        };
    }];
}

@end
