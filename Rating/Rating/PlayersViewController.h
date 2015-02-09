//
//  PlayersViewController.h
//  Rating
//
//  Created by Tait on 15/2/9.
//  Copyright (c) 2015年 Tait. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
