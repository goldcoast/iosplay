//
//  POPDViewController.m
//  popdowntable
//
//  Created by Alex Di Mango on 15/09/2013.
//  Copyright (c) 2013 Alex Di Mango. All rights reserved.
//

#import "POPDViewController.h"
#import "POPDCell.h"

#define TABLECOLOR [UIColor colorWithRed:62.0/255.0 green:76.0/255.0 blue:87.0/255.0 alpha:1.0]
#define CELLSELECTED [UIColor colorWithRed:52.0/255.0 green:64.0/255.0 blue:73.0/255.0 alpha:1.0]
#define SEPARATOR [UIColor colorWithRed:31.0/255.0 green:38.0/255.0 blue:43.0/255.0 alpha:1.0]
#define SEPSHADOW [UIColor colorWithRed:80.0/255.0 green:97.0/255.0 blue:110.0/255.0 alpha:1.0]
#define SHADOW [UIColor colorWithRed:69.0/255.0 green:84.0/255.0 blue:95.0/255.0 alpha:1.0]
#define TEXT [UIColor colorWithRed:223.0/255.0 green:223.0/255.0 blue:213.0/255.0 alpha:1.0]

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f


static NSString *kheader = @"menuSectionHeader";
static NSString *ksubSection = @"menuSubSection";

@interface POPDViewController ()
@property NSArray *sections;
@property (strong, nonatomic) NSMutableArray *sectionsArray;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@property (strong, nonatomic) NSMutableArray *showingArray;
@end


@implementation POPDViewController
@synthesize delegate;

- (id)initWithMenuSections:(NSArray *) menuSections
{
    self = [super init];
    if (self) {
        self.sections = menuSections;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tableView.backgroundColor = TABLECOLOR;
//    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.tableView.frame = self.view.frame;

    self.sectionsArray = [NSMutableArray new];
    self.showingArray = [NSMutableArray new];
    self.itemsArray = [NSMutableArray new];
    [self setMenuSections:self.sections];
    
}

- (void)setMenuSections:(NSArray *)menuSections{
    
    for (NSDictionary *sec in menuSections) {
        
        NSString *header = [sec objectForKey:kheader];
        NSString *subSection = [sec objectForKey:ksubSection];

        NSMutableArray *section = [NSMutableArray new];
        [section addObject:header];
        [section addObject:subSection];
//        for (NSString *sub in subSection) {
//            [section addObject:sub];
//        }
        [self.sectionsArray addObject:section];
        [self.showingArray addObject:[NSNumber numberWithBool:NO]];
        
        [self.itemsArray addObject:header];
        [self.itemsArray addObject:subSection];
    }
    
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    
    return [self.sectionsArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    
    if (![[self.showingArray objectAtIndex:section]boolValue]) {
        return 1;
    }
    else{
        return [[self.sectionsArray objectAtIndex:section]count];;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if(indexPath.row ==0){
        if([[self.showingArray objectAtIndex:indexPath.section]boolValue]){
            [cell setBackgroundColor:CELLSELECTED];
        }else{
            [cell setBackgroundColor:[UIColor clearColor]];
//            cell.textLabel.font = [UIFont systemFontOfSize:12.0];
//            cell.textLabel.adjustsFontSizeToFitWidth = YES;
//            cell.textLabel.numberOfLines = 1;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *text = [self.itemsArray objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    
    NSDictionary *attrsDic = @{NSFontAttributeName: [UIFont systemFontOfSize:FONT_SIZE]};
    
    NSAttributedString *attributedText =[[NSAttributedString alloc]initWithString:text attributes:attrsDic];
    
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height + (CELL_CONTENT_MARGIN * 2);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellIdentifier = @"menuCell";
    #warning : Use here your custom cell, instead of POPDCell
    
    //********* BEGIN ********
    POPDCell *cell;
    UILabel *label = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] ;
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setMinimumScaleFactor:FONT_SIZE];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [label setTag:1];
        
        [[label layer] setBorderWidth:2.0f];
        
        [[cell contentView] addSubview:label];
        
    }
    NSString *text = [self.itemsArray objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:text attributes:@{
                                                                                                     NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]
                                                                                                     }];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    if (!label)
        label = (UILabel*)[cell viewWithTag:1];
    
    [label setText:text];
    [label setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
    
    
    //********* E N D ********
    
//    POPDCell *cell = nil;
//    cell = (POPDCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"POPDCell" owner:self options:nil];
    
//    if (cell == nil) {
//        cell = [topLevelObjects objectAtIndex:0];
//    }
    NSLog(@"indexpath.section: %ld, row: %li", (long)indexPath.section, (long)indexPath.row);
    //todo: 这里会错
    cell.labelText.text = [[self.itemsArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cell.labelText.textColor = TEXT;
//    cell.separator.backgroundColor = SEPARATOR;
//    cell.sepShadow.backgroundColor = SEPSHADOW;
//    cell.shadow.backgroundColor = SHADOW;

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([[self.showingArray objectAtIndex:indexPath.section]boolValue]){
        [self.showingArray setObject:[NSNumber numberWithBool:NO] atIndexedSubscript:indexPath.section];
    }else{
        [self.showingArray setObject:[NSNumber numberWithBool:YES] atIndexedSubscript:indexPath.section];
    }
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];

    [self.delegate didSelectRowAtIndexPath:indexPath];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
