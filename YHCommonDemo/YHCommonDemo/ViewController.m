//
//  ViewController.m
//  YHCommonDemo
//
//  Created by yahua on 16/3/3.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import "ViewController.h"

#import "YHCommon.h"
#import "UIViewController+Metrics.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *test = @"1234";
    NSLog(@"%@", [test MD5]);
    if ([NSString stringIsNullOrEmpty:test]) {
        NSLog(@"");
    }
    test = nil;
    if ([NSString stringIsNullOrEmpty:test]) {
        NSLog(@"");
    }
    test = @"  ";
    if ([NSString stringIsNullOrEmpty:test]) {
        NSLog(@"");
    }
    test = nil;
    
    @weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
       @strongify(self)
        self.view.backgroundColor = [UIColor redColor];
    });
    
    CGFloat width  = self.width;
    NSLog(@"");
    
    [UIFont setStandardUIWidth:320];
    UIFont *font = [UIFont autoFontOfSize:12.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
