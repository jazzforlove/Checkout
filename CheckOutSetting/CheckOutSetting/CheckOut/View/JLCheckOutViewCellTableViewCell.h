//
//  JLCheckOutViewCellTableViewCell.h
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YXCheckWorkTypeOnWorkTime = 0,
    YXCheckWorkTypeoffWorkTime,
} YXCheckWorkType;

@interface JLCheckOutViewCellTableViewCell : UITableViewCell

@property (nonatomic, assign) YXCheckWorkType type;

@end

NS_ASSUME_NONNULL_END
