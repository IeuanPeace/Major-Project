//
//  TableViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 21/12/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//

#import "TableViewController.h"
#import "RiverList.h"
#import "MyRiverList.h"

@implementation TableViewController


@synthesize riverName;
@synthesize sectionName;
@synthesize grade;
@synthesize decription;

@synthesize rivers;

@synthesize ops;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    MyRiverList * myrivers =[[MyRiverList alloc] init];
    self.rivers = [myrivers getMyRivers];
    [self.riverName setText:((RiverList *) [self.rivers objectAtIndex:0]).River];
    [self.sectionName setText:((RiverList *) [self.rivers objectAtIndex:0]).Section];
    [self.grade setText:((RiverList *) [self.rivers objectAtIndex:0]).Grade];
    [self.decription setText:((RiverList *) [self.rivers objectAtIndex:0]).Description];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rivers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set up the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RiverCell"];
	RiverList *aRiver = [self.rivers objectAtIndex:indexPath.row];
	cell.textLabel.text = aRiver.River;
	cell.detailTextLabel.text = aRiver.Section;
    return cell;
    //RiverList * riverListObj = [ops.getMyRivers objectAtIndex:indexPath.row];
    //cell.textLabel.text = riverListObj.River;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        ViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.myRiverListDetail = [self.rivers objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
    }
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

@end
