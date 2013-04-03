//
//  NewCommentViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 02/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewCommentViewController : UIViewController <UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UITextView *commentText;

@end