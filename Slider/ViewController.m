//
//  ViewController.m
//  Slider
//
//  Created by Brandon Leeds on 8/17/15.
//  Copyright (c) 2015 Brandon Leeds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
 
    
    BLDropDownSlider *tableView = [[BLDropDownSlider alloc] initWithFrame:CGRectMake(0, 0, 600, 670) style:UITableViewStyleGrouped];
    [tableView setValues];
    tableView.delegate = tableView;
    tableView.dataSource = tableView;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
