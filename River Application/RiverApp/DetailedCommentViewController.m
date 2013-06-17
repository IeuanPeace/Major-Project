//
//  DetailedCommentViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 19/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import "DetailedCommentViewController.h"



@implementation DetailedCommentViewController

@synthesize commentLabel;
@synthesize dateLable;
@synthesize object;

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

    self.commentLabel.text = [object objectForKey:@"commentText"];
    self.dateLable.text = [NSDateFormatter localizedStringFromDate:[object createdAt]
                           dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterLongStyle];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
