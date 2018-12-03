//
//  JLCheckOutViewCellTableViewCell.m
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//


#import "JLCheckOutViewCellTableViewCell.h"
#import "UIPickerView+malPicker.h"
#import "Tools.h"

@interface JLCheckOutViewCellTableViewCell ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UIPickerView *pickerView2;
@property (nonatomic,strong) UILabel *zhiLab;
@property (nonatomic,strong) UILabel *colonLab;
@property (nonatomic,strong) UILabel *colonLab2;
@property (nonatomic, strong) UILabel *line1;
@property (nonatomic, strong) UILabel *line2;

@end

@implementation JLCheckOutViewCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    
    [self.contentView addSubview:self.pickerView];
    [self.contentView addSubview:self.pickerView2];
    [self.contentView addSubview:self.colonLab];
    [self.contentView addSubview:self.colonLab2];
    [self.contentView addSubview:self.zhiLab];
    [self.contentView addSubview:self.line1];
    [self.contentView addSubview:self.line2];

    NSArray *item1 = self.items[0];
    NSArray *item2 = self.items[1];
    [self.pickerView selectRow:item1.count +8 inComponent:0 animated:NO];
    [self.pickerView selectRow:item2.count inComponent:1 animated:NO];
    [self.pickerView clearSeparatorLine];
    [self.pickerView2 selectRow:item1.count +13 inComponent:0 animated:NO];
    [self.pickerView2 selectRow:item2.count inComponent:1 animated:NO];
    [self.pickerView2 clearSeparatorLine];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat screenWidth = self.contentView.bounds.size.width;
    CGFloat contentHeight = self.contentView.bounds.size.height;
    CGFloat pickerWidth = (screenWidth-30)/3;
    [self.pickerView setFrame:CGRectMake(15, 0, pickerWidth, self.contentView.bounds.size.height)];
    [self.colonLab setFrame:CGRectMake(0, 0, 20, contentHeight/7)];
    self.colonLab.center = self.pickerView.center;
    [self.zhiLab setFrame:CGRectMake(CGRectGetMaxX(self.pickerView.frame), contentHeight*3/7, pickerWidth, contentHeight/7)];
    [self.pickerView2 setFrame:CGRectMake(CGRectGetMaxX(self.zhiLab.frame), 0, pickerWidth, self.contentView.bounds.size.height)];
    [self.colonLab2 setFrame:CGRectMake(0, 0, 20, contentHeight/7)];
    self.colonLab2.center = self.pickerView2.center;
    [self.line1 setFrame:CGRectMake(0, contentHeight*3/7-1, screenWidth, 1)];
    [self.line2 setFrame:CGRectMake(0, contentHeight*4/7-1, screenWidth, 1)];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.items.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *pickerItems = self.items[component];
    return [pickerItems count]*3;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *pickerItems = self.items[component];
    return [pickerItems objectAtIndex:(row%[pickerItems count])];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.contentView.bounds.size.height/7;
}
- (NSInteger)selectedRowInComponent:(NSInteger)component{
    return 0;
}

- (UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.backgroundColor = [UIColor clearColor];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
//        _pickerView.showsSelectionIndicator = YES;
    }
    return _pickerView;
}
- (UIPickerView *)pickerView2{
    if (!_pickerView2) {
        _pickerView2 = [[UIPickerView alloc]init];
        _pickerView2.backgroundColor = [UIColor clearColor];
        _pickerView2.dataSource = self;
        _pickerView2.delegate = self;
//        _pickerView2.showsSelectionIndicator = NO;
        
    }
    return _pickerView2;
}

- (UILabel *)line1{
    if (!_line1) {
        _line1 = [[UILabel alloc]init];
        _line1.backgroundColor = [Tools changeColor:@"#E1E1E1"];
    }
    return _line1;
}
- (UILabel *)line2{
    if (!_line2) {
        _line2 = [[UILabel alloc]init];
        _line2.backgroundColor = [Tools changeColor:@"#E1E1E1"];
    }
    return _line2;
}
- (UILabel *)zhiLab{
    if (!_zhiLab) {
        _zhiLab = [[UILabel alloc]init];
        _zhiLab.textColor = [UIColor blackColor];
        _zhiLab.text = @"至";
        _zhiLab.textAlignment = NSTextAlignmentCenter;
        _zhiLab.font = [UIFont systemFontOfSize:17];
    }
    return _zhiLab;
}
- (UILabel *)colonLab{
    if (!_colonLab) {
        _colonLab = [[UILabel alloc]init];
        _colonLab.text = @":";
        _colonLab.backgroundColor = [UIColor clearColor];
        _colonLab.font = [UIFont systemFontOfSize:18];
        _colonLab.textAlignment = NSTextAlignmentCenter;
    }
    return _colonLab;
}
- (UILabel *)colonLab2{
    if (!_colonLab2) {
        _colonLab2 = [[UILabel alloc]init];
        _colonLab2.text = @":";
        _colonLab2.backgroundColor = [UIColor clearColor];
        _colonLab2.font = [UIFont systemFontOfSize:18];
        _colonLab2.textAlignment = NSTextAlignmentCenter;
    }
    return _colonLab2;
}

- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
        NSMutableArray *item1 = [NSMutableArray array];
        for (NSUInteger i = 1; i < 25; i++) {
            [item1 addObject:[NSString stringWithFormat:@"%.2lu",(unsigned long)i]];
        }
        NSMutableArray *item2 = [NSMutableArray array];
        for (NSUInteger i = 0; i < 60; i++) {
            [item2 addObject:[NSString stringWithFormat:@"%.2lu",(unsigned long)i]];
        }
        [_items addObject:item1];
        [_items addObject:item2];
    }
    return _items;
}



@end
