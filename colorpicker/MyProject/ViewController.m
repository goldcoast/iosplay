//
//  ViewController.m
//  MyProject
//
//  Created by cindy on 15/11/22.
//  Copyright (c) 2015年 Tait.X. All rights reserved.
//

#import "ViewController.h"
#import "ColorUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.resultColorLabel.text = @"this is test result: ..";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testClick:(id)sender {
    
    UIImage *image = [UIImage imageNamed:@"all.jpeg"];
    
    NSLog(@"number = %@", [ ImageColor getRGBAsFromImage:image atX:186 andY:206 count:1]);
    
    
}


@end
