//
//  ViewController.m
//  CheckOutSetting
//
//  Created by 李国卿 on 2018/11/30.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import "ViewController.h"
#import "JLCheckoutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)checkOutSetting:(id)sender {
    [self.navigationController pushViewController:[JLCheckoutViewController new] animated:YES];
}


@end
