//
//  CommentTableViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 15/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import "CommentTableViewController.h"
#import "ViewController.h"

@implementation CommentTableViewController
@synthesize comment;
@synthesize ID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This code was from a Parse Tutorial


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // This table displays items in the Todo class
        self.className = @"Comments";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = NO;
        self.objectsPerPage = 40;
    }
    return self;
}

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.className];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"riverID" equalTo:[NSNumber numberWithInteger:self.theRiverID]];
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object
{
    static NSString *cellIdentifier = @"Cell";
    
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell to show todo item with a priority at the bottom
    cell.textLabel.text = [object objectForKey:@"commentText"];
    self.ID = [object objectForKey:@"commentText"];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showTheRiverID"]) {
        NewCommentViewController *detailViewController = [segue destinationViewController];
      //  NSNumber *riverID = [NSNumber numberWithInteger:self.theRiverID];
        detailViewController.theRiverID = self.theRiverID;
        
    }
    if ([[segue identifier] isEqualToString:@"showTheCommentID"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        DetailedCommentViewController *detailViewController = [segue destinationViewController];
        detailViewController.object = object;

    }
}

@end
