//
//  CommentTableViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 15/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "RiverList.h"
#import "NewCommentViewController.h"
#import "DetailedCommentViewController.h"

@interface CommentTableViewController : PFQueryTableViewController

@property (nonatomic, strong) RiverList * myRiverListDetail;
@property (nonatomic) int theRiverID;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, weak) NSArray *comment;


@end
