//
//  ViewController.m
//  Star
//
//  Created by jkc on 16/4/12.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import "ViewController.h"
#import "CJTStarView.h"
#import "CJTStarView2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    CJTStarView *star = [[CJTStarView alloc] initWithFrame:CGRectMake(100, 100, size.width-200, 50) starCount:5];
    star.openHalf = NO;
    [self.view addSubview:star];
    
    CJTStarView2 *star2 = [[CJTStarView2 alloc] initWithFrame:CGRectMake(100, 300, size.width-200, 50) starCount:10];
    [self.view addSubview:star2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
