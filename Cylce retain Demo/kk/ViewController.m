//
//  ViewController.m
//  kk
//
//  Created by kyle on 2017/4/6.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"main" object:nil];
    
}


@end
