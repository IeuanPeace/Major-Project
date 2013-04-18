//
//  NewCommentViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 02/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RiverList.h"

@interface NewCommentViewController : UIViewController <UITextViewDelegate>

- (IBAction)submitButton:(id)sender;
@property (nonatomic, strong) RiverList * myRiverListDetail;
@property (strong, nonatomic) IBOutlet UITextView *commentText;
@property (nonatomic) int theRiverID;

@end