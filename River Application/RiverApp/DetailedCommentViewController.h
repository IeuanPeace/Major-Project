//
//  DetailedCommentViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 19/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailedCommentViewController : UIViewController

@property (nonatomic, weak) NSString * commentID;
@property (nonatomic, weak) PFObject * object;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLable;

@end
