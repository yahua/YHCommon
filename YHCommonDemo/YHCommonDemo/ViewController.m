//
//  ViewController.m
//  YHCommonDemo
//
//  Created by yahua on 16/3/3.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import "ViewController.h"

#import "YHCommon.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *tipsLabel;

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
    
    
    [self.view addSubview:self.tipsLabel];
    
    
    //[UIFont setStandardUIWidth:320];
    //UIFont *font = [UIFont autoFontOfSize:12.0f];
    
    NSLog(@"");
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
   // [self.tipsLabel leftInContainer:50 shouldResize:NO];
}

#pragma mark - Getters and Setters

- (UILabel *)tipsLabel {
    
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 50)];
        _tipsLabel.text = @"YAHLayout";
        _tipsLabel.textColor = [UIColor blackColor];
    }
    
    return _tipsLabel;
}

@end
