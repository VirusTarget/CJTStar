//
//  ViewController.m
//  Star
//
//  Created by jkc on 16/4/12.
//  Copyright © 2016年 CJT. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"
#import "StarView2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    StarView *Star = [[StarView alloc] initWithFrame:CGRectMake(100, 100, size.width-200, 50) AndStarCount:5];
    Star.OpenHalf = YES;
    [self.view addSubview:Star];
    [self.view setUserInteractionEnabled:YES];
    
    StarView2 *Star2 = [[StarView2 alloc] initWithFrame:CGRectMake(100, 300, size.width-200, 50) AndStarCount:5];
    [self.view addSubview:Star2];
    [self.view setUserInteractionEnabled:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
