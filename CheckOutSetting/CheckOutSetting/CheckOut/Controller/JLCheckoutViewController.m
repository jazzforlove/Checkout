//
//  JLCheckoutViewController.m
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "JLCheckoutViewController.h"
#import "JLCheckOutViewCellTableViewCell.h"
#import "Tools.h"
#define YXGlobalBGColor RGBColor(244,244,244)
#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

static NSString *timeIdentifier = @"firstCell";
static NSString *identifier = @"otherCell";

@interface JLCheckoutViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSArray *sectionArr;

@end

@implementation JLCheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self setupUI];
    
}
- (void)setNavigationItem{
    //16,133,226
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [Tools imageWithColor:RGBColor(16,133,226) size:CGSizeMake(self.view.bounds.size.width, 64)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLab.text = @"设置工作时间";
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:titleLab];
    
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
}
- (void)setupUI{
    [self.view addSubview:self.tableview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        JLCheckOutViewCellTableViewCell *timeCell = [tableView dequeueReusableCellWithIdentifier:timeIdentifier forIndexPath:indexPath];
        cell = timeCell;
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 250;
    }else if (indexPath.section == 1){
        return 64;
    }
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    UILabel *headerLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.view.bounds.size.width-30, 24)];
    headerLab.text = self.sectionArr[section];
    headerLab.backgroundColor = [UIColor clearColor];
    headerLab.textColor = [UIColor lightGrayColor];
    headerLab.font = [UIFont systemFontOfSize:12];
    [headerView addSubview:headerLab];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 24;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]init];
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (void)leftBtnDidClick{
    [self.navigationController popViewControllerAnimated:YES];
}


- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.backgroundColor = YXGlobalBGColor;
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.allowsSelection = NO;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableview registerClass:[JLCheckOutViewCellTableViewCell class] forCellReuseIdentifier:timeIdentifier];
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableview;
}
- (NSArray *)sectionArr{
    if (!_sectionArr) {
        _sectionArr = @[@"设置时间",@"设置工作日",@"在工作时间外,他人私聊您将被告知非工作时间无法及时回复"];
    }
    return _sectionArr;
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
