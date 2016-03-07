//
//  ViewController.m
//  YHCommonDemo
//
//  Created by 王时温 on 16/3/3.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import "ViewController.h"

#import "YHCommon.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *test = @"1234";
    NSLog(@"%@", [test MD5]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
