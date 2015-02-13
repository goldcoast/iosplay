//
//  POPDSampleViewController.m
//  popdowntable
//
//  Created by Alex Di Mango on 15/09/2013.
//  Copyright (c) 2013 Alex Di Mango. All rights reserved.
//

#import "POPDSampleViewController.h"
#import "POPDViewController.h"

static NSString *kheader = @"menuSectionHeader";
static NSString *ksubSection = @"menuSubSection";

@interface POPDSampleViewController()<POPDDelegate> 

@end

@implementation POPDSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"securityInfo" ofType:@"plist"];
    NSArray *menu = [[NSMutableArray alloc]initWithContentsOfFile:path];
    
    POPDViewController *popMenu = [[POPDViewController alloc]initWithMenuSections:menu];
    popMenu.delegate = self;
    popMenu.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //ios7 status bar
    popMenu.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    [self addChildViewController:popMenu];
    [self.view addSubview:popMenu.view];
        
}

#pragma mark POPDViewController delegate

-(void) didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"didSelectRowAtIndexPath: %ld,%ld",(long)indexPath.section,(long)indexPath.row);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
