//
//  NewCommentViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 02/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import "NewCommentViewController.h"
#import "ViewController.h"

@implementation NewCommentViewController

@synthesize commentText;

#pragma mark - NSObject

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveComment:(id)sender {

    NSString *commentString = self.commentText.text;
    PFObject *comment = [PFObject objectWithClassName:@"Comment"];
    [comment setObject:commentString forKey:@"commentText"];
    [comment setObject:[NSNumber numberWithInt:self.theRiverID] forKey:@"riverID"];
    [comment save];
    
}

@end
