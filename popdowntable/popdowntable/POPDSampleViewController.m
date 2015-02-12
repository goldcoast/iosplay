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
    
    NSString *sucSectionsA = @"我来贷的每一份合同，都加盖中国金融认证中心(CFCA)权威电子印章，得到“国家级”的全面认证，其认证后的电子印章无法被篡改、伪造，有效保证投资人和借款人的合法权益。";
    NSString *sucSectionsB = @"Review";
    NSString *sucSectionsC = @"Popular Science";

    NSDictionary *sectionA = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"法律保障", kheader,
                                    sucSectionsA, ksubSection,
                                    nil];
    
    NSDictionary *sectionB = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"Film & Animation", kheader,
                        sucSectionsB, ksubSection,
                        nil];
    
    NSDictionary *sectionC = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"Science & Technology", kheader,
                        sucSectionsC, ksubSection,
                        nil];
    
    NSArray *menu = [NSArray arrayWithObjects:sectionA,sectionB,sectionC, nil];
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
