//
//  JLCheckoutDayCell.m
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/12/3.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//
#define YXGlobalBGColor RGBColor(244,244,244)
#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define KCount 7
#define KLeft  30
#define KMargin 15
#define kBtnWidth ([UIScreen mainScreen].bounds.size.width - 2*KLeft - KMargin*(KCount -1))/KCount


#import "JLCheckoutDayCell.h"

@implementation JLCheckoutDayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    for (NSInteger i = 0; i < 7; i ++) {
        UIButton *btn = [[UIButton alloc]init];
        CGFloat btnX = KLeft + (KMargin + kBtnWidth)*i;
        CGFloat btnY = KMargin;
        [btn setFrame:CGRectMake(btnX, btnY, kBtnWidth, kBtnWidth)];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = kBtnWidth/2;
        btn.backgroundColor = RGBColor(16,133,226);
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        switch (i) {
            case 0:
            {
                [btn setTitle:@"日" forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [btn setBackgroundColor:YXGlobalBGColor];
                break;
            }
            case 1:
            {
                [btn setTitle:@"一" forState:UIControlStateNormal];
                break;
            }
            case 2:
            {
                [btn setTitle:@"二" forState:UIControlStateNormal];
                break;
            }
            case 3:
            {
                [btn setTitle:@"三" forState:UIControlStateNormal];
                break;
            }
            case 4:
            {
                [btn setTitle:@"四" forState:UIControlStateNormal];
                break;
            }
            case 5:
            {
                [btn setTitle:@"五" forState:UIControlStateNormal];
                break;
            }
            case 6:
            {
                [btn setTitle:@"六" forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [btn setBackgroundColor:YXGlobalBGColor];
                break;
            }
                
                
            default:
                break;
        }
        
        [self.contentView addSubview:btn];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
